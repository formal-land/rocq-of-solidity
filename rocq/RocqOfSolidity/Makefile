.PHONY: all clean clean-util distclean default

# Fixture targets generate their own modules before compiling the aggregate manifest.
PROJECT_FILES = find -L . -path './Evm/Tests/Ethereum/Generated*' -prune -o -name '*.v' ! -path './Evm/Tests/Ethereum/Manifest.v' -print | grep -v -f blacklist.txt | sort
VFILES := $(shell $(PROJECT_FILES))

default: all

RocqMakefile: $(VFILES) blacklist.txt Makefile
	echo "-R . RocqOfSolidity" > _RocqProject
	echo "-arg -impredicative-set -arg -w -arg -stdlib-vector" >> _RocqProject
	# We copy & paste the command to find files as this variable is too long on command line
	$(PROJECT_FILES) >> _RocqProject
	coq_makefile -f _RocqProject -o $@

MAKEROCQ := +$(MAKE) -f RocqMakefile

%.vo: RocqMakefile %.v
	$(MAKEROCQ) $@

all: RocqMakefile
	$(MAKEROCQ) all

clean-rocq: RocqMakefile
	$(MAKEROCQ) clean

clean-util:
	rm -f *RocqMakefile*

clean: clean-rocq
	$(MAKE) clean-util # done separately to enforce order

distclean: clean

.PHONY: evm-fixtures-smoke evm-fixtures-full evm-fixtures-probes
evm-fixtures-smoke evm-fixtures-full evm-fixtures-probes: all
	python3 ../scripts/evm-fixtures/run.py $(patsubst evm-fixtures-%,%,$@)
