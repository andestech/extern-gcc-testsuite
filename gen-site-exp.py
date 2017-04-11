#! /usr/bin/env python2

site_config = dict()
site_config["rootme"] = "/NOBACKUP/atcsqa06/kito/llvm-run-gcc-test"
site_config["host_triplet"] = "x86_64-pc-linux-gnu"
site_config["build_triplet"] = "x86_64-pc-linux-gnu"
site_config["target_triplet"] = "nds32-unknown-elf"
site_config["target_alias"] = "nds32-elf"
site_config["libiconv"] = ""
site_config["CFLAGS"] = ""
site_config["CXXFLAGS"] = ""
site_config["HOSTCC"] = "/NOBACKUP/atcsqa06/kito/build-system-3-riscv/host-tools/icecream/gcc-6.1.0-riscv/gcc"
site_config["HOSTCFLAGS"] = ""
site_config["TEST_ALWAYS_FLAGS"] = "-Wno-ignored-optimization-argument -Wno-unknown-warning-option -Wno-return-type -Wno-implicit-function-declaration -Wno-unknown-attributes -Qunused-arguments -Wno-ignored-attributes -Wno-keyword-macro -Wno-format -Wno-shift-negative-value"
site_config["TESTING_IN_BUILD_TREE"] = "0"
site_config["HAVE_LIBSTDCXX_V3"] = "1"
site_config["ISLVER"] = ""
site_config["tmpdir"] = "/NOBACKUP/atcsqa06/kito/llvm-run-gcc-test/test"
site_config["srcdir"] = "/NOBACKUP/atcsqa06/kito/build-system-3-riscv/source-packages/gcc-6.1.0-riscv-riscv-gcc-6.1.0/gcc/testsuite"
site_config["GCC_UNDER_TEST"] = "/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin/nds32le-elf-clang"
site_config["GXX_UNDER_TEST"] = "/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin/nds32le-elf-clang++"
site_config["SIM"] = "/NOBACKUP/atcsqa06/kito/build-system-3/toolchain/nds32le-elf-newlib-v3/bin/nds32le-elf-run"


def gen_site_exp(exp_path):
   with open(exp_path, "w") as exp:
     for config_name, config in site_config.iteritems():
       exp.write("set %s \"%s\"\n" % (config_name, config))

gen_site_exp("test.exp")
