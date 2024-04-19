# RISC-V GNU Toolchain for CargOS

A large portion of CargOS code is written in C23, the latest revision of C. Currently, the [RISC-V GNU toolchains](https://github.com/riscv-collab/riscv-gnu-toolchain) provided by most major Linux distributions do not implement many crucial C23 features (e.g. `nullptr` and `[[noreturn]]`). Thus, in order to give the developers of CargOS a more comfortable development experience, this repository supplies them with recently precompiled binaries of the RISC-V GNU toolchain.

The toolchain is configured to target RV64GC, and [Newlib](https://sourceware.org/newlib/) is set as the backend of the C standard library. The binaries can be reproduced by the following commands (access to `/opt/riscv` is required):
```shell
git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv
make
```

The archives of the compilation products can be found under [Releases](https://github.com/carg-os/riscv-gnu-toolchain/releases). Install by extracting them to convenient places such as `/opt`. **Note also that the developers of CargOS are not responsible if these binaries are malicious. Use at your own risk!**
