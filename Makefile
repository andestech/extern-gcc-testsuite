DEJAGNULIBS=$(shell pwd)/dejagnu
export DEJAGNULIBS
RUNTESTFLAGS=--target_board=riscv-sim
#RUN_PATH=/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin
RUN_PATH=/home/users/shiva/playground/build-system-3/toolchain/riscv32ima-elf-newlib/bin
PATH:=$(RUN_PATH):$(PATH)
export PATH


clean:
	rm -rf gcc.log gcc.sum *.bc *.s gcc *.filtered
echo:
	echo $(PATH)

site.exp: gen-site-exp.py
	python2 ./gen-site-exp.py

exe: clean site.exp
	mkdir -p gcc
	ln -s ../site.exp gcc/site.exp
	cd gcc && runtest --tool gcc $(RUNTESTFLAGS) execute.exp

parallel.mak: gen-parallel-test-rule
	python2 ./gen-parallel-test-rule testsuite-gcc-6.1.0 gcc > parallel.mak

all-parallel: clean site.exp parallel.mak
	$(MAKE) do-parallel-test
	cp gcc/gcc.* .

all: clean site.exp
	mkdir -p gcc
	cd gcc && runtest --tool gcc $(RUNTESTFLAGS)

filter:
	python2 ./filter.py

single-test:
	runtest --tool gcc $(RUNTESTFLAGS) $(EXP)="$(TEST)"

-include parallel.mak
