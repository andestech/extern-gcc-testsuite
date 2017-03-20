DEJAGNULIBS=$(shell pwd)/dejagnu
export DEJAGNULIBS
RUNTESTFLAGS=--target_board=riscv-sim
#RUN_PATH=/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin
RUN_PATH=/home/users/shiva/playground/build-system-3/toolchain/riscv32ima-elf-newlib/bin
PATH:=$(RUN_PATH):$(PATH)
export PATH


clean:
	rm -rf gcc.log gcc.sum *.bc *.s
echo:
	echo $(PATH)

exe: clean
	runtest --tool gcc $(RUNTESTFLAGS) execute.exp

all: clean
	runtest --tool gcc $(RUNTESTFLAGS)

filter:
	python2 ./filter.py
