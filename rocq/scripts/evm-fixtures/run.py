"""Build the pinned EVM tests. Run via the evm-fixtures-* Make targets."""
import argparse
from concurrent.futures import ThreadPoolExecutor
import fcntl
import hashlib
import json
import os
from pathlib import Path
import resource
import shutil
import subprocess
import sys
import tarfile
import tempfile
import urllib.request

from generate_suite import generate, gen

SHA256 = "92cf1b47ad12fb27163261fc3c1cea5df72439cab507983d06b56c94f8741909"
URL = "https://github.com/ethereum/execution-spec-tests/releases/download/v5.4.0/fixtures_stable.tar.gz"
BUILD = gen.REPO_ROOT / "build" / "evm-fixtures"
PROBES = ("GeneratedStPre2Probe", "GeneratedStStaticProbeNew")


OSAKA_URL = "https://github.com/ethereum/execution-specs/releases/download/tests%40v21.0.0/fixtures.tar.gz"
OSAKA_SHA256 = "dd642a261ac63f910b85c47d2549d2bb3ae4ad044fb5e852657f783441483bb2"


def extract_fixtures(destination, osaka=False):
    url, digest = (OSAKA_URL, OSAKA_SHA256) if osaka else (URL, SHA256)
    prefix = ("fixtures", "state_tests", "for_osaka", "osaka") if osaka else ("fixtures", "state_tests")
    supplied = os.environ.get("EEST_ARCHIVE")
    cache = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache"))
    archive = Path(supplied) if supplied else cache / "rocq-of-solidity" / digest
    if not supplied:
        archive.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=destination) as tmp:
        download = Path(tmp) / "download"
        source = archive
        if not supplied and not archive.exists():
            with urllib.request.urlopen(url, timeout=120) as response, download.open("wb") as out:
                shutil.copyfileobj(response, out)
            source = download
        with source.open("rb") as inp:
            checksum = hashlib.sha256()
            for chunk in iter(lambda: inp.read(1 << 20), b""):
                checksum.update(chunk)
            if checksum.hexdigest() != digest:
                raise ValueError(f"incorrect SHA-256 for {source}")
            inp.seek(0)
            with tarfile.open(fileobj=inp, mode="r|gz") as tar:
                for member in tar:
                    path = Path(member.name)
                    if (path.parts[:len(prefix)] == prefix and
                            ".." not in path.parts and path.suffix == ".json" and member.isfile()):
                        target = destination / path
                        target.parent.mkdir(parents=True, exist_ok=True)
                        with target.open("wb") as out:
                            shutil.copyfileobj(tar.extractfile(member), out)
        if source == download:
            with tempfile.NamedTemporaryFile(dir=archive.parent, delete=False) as out:
                with source.open("rb") as inp:
                    shutil.copyfileobj(inp, out)
            os.replace(out.name, archive)


def compile_suite(root, name, files, jobs, shard, shards):
    out = root / name
    namespace = "RocqOfSolidity.Evm.Tests.Ethereum"
    # Checking the final proof term for multiple 24 KiB deployed contracts
    # can exceed the default 8 MiB native stack during Qed.
    hard_stack = resource.getrlimit(resource.RLIMIT_STACK)[1]
    stack = 128 << 20
    if hard_stack != resource.RLIM_INFINITY:
        stack = min(stack, hard_stack)
    command = ["prlimit", "--as=6442450944", f"--stack={stack}:", "--", "coqc", "-q",
               "-R", str(gen.ROCQ_ROOT), "RocqOfSolidity",
               "-Q", str(out), namespace + "." + name,
               "-impredicative-set", "-w", "-stdlib-vector"]
    deps = max(p.stat().st_mtime_ns for p in gen.ROCQ_ROOT.rglob("*.vo")
               if "Generated" not in p.parts)
    def compile_one(filename):
        source = out / filename
        vo = source.with_suffix(".vo")
        receipt = source.with_suffix(".checked")
        if receipt.exists() and vo.exists() and vo.stat().st_mtime_ns >= max(deps, source.stat().st_mtime_ns):
            return filename, "passed"
        receipt.unlink(missing_ok=True)
        try:
            result = subprocess.run([*command, str(source)], timeout=900, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT)
            if result.returncode:
                source.with_suffix(".log").write_bytes(result.stdout)
                return filename, "failed"
            receipt.touch()
            return filename, "passed"
        except subprocess.TimeoutExpired as exc:
            source.with_suffix(".log").write_bytes(exc.stdout or b"")
            return filename, "timeout"

    selected = files[shard::shards]
    report = root / f"{name}-{shard}-of-{shards}.jsonl"
    failed = 0
    with report.open("w") as log, ThreadPoolExecutor(max_workers=jobs) as pool:
        for index, (filename, status) in enumerate(pool.map(compile_one, selected), 1):
            log.write(json.dumps(dict(case=filename, status=status)) + "\n")
            log.flush()
            if status != "passed":
                failed += 1
                print(status, filename, flush=True)
            elif index % 100 == 0:
                print(f"{name} {index}/{len(selected)}", flush=True)
    if not failed and shards == 1:
        _, status = compile_one("Manifest.v")
        if status != "passed":
            raise RuntimeError(f"{name} manifest {status}")
        if name == "Generated":
            aggregate = root / "Manifest.v"
            shutil.copyfile(gen.ROCQ_ROOT / "Evm/Tests/Ethereum/Manifest.v", aggregate)
            subprocess.run([*command, "-Q", str(root), namespace, str(aggregate)], check=True)
    print(f"{name}: {len(selected) - failed} passed, {failed} failed or timed out", flush=True)
    return failed


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("mode", choices=("smoke", "full", "probes", "probes-archive", "osaka"))
    args = parser.parse_args()
    jobs = int(os.environ.get("EVM_FIXTURE_JOBS", 1))
    shard = int(os.environ.get("EVM_FIXTURE_SHARD", 0))
    shards = int(os.environ.get("EVM_FIXTURE_SHARDS", 1))
    if jobs < 1 or not 0 <= shard < shards:
        parser.error("invalid worker count or shard index")
    root = BUILD / args.mode
    root.mkdir(parents=True, exist_ok=True)
    with (root / ".lock").open("a") as lock, tempfile.TemporaryDirectory(dir=root) as tmp:
        fcntl.flock(lock, fcntl.LOCK_EX)
        fixtures = Path(tmp)
        extract_fixtures(fixtures, osaka=args.mode == "osaka")
        failed = 0
        suites = {"probes": PROBES, "probes-archive": PROBES, "osaka": ("GeneratedOsaka",)}.get(args.mode, ("Generated",))
        for name in suites:
            archive = args.mode == "probes-archive"
            files = generate(fixtures, root / name, name, args.mode == "smoke", archive)
            if archive:
                continue
            failed += compile_suite(root, name, files, jobs, shard, shards)
    return int(bool(failed))


if __name__ == "__main__":
    sys.exit(main())
