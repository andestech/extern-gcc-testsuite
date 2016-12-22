DEJAGNULIBS=$(shell pwd)/dejagnu
export DEJAGNULIBS
RUNTESTFLAGS=--target_board=nds32-sim-clang
RUN_PATH=/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin
PATH:=$(RUN_PATH):$(PATH)
export PATH


echo:
	echo $(PATH)

exe:
	runtest --tool gcc $(RUNTESTFLAGS) execute.exp

all:
	runtest --tool gcc $(RUNTESTFLAGS)
