# Maintainer: Sick Codes <info at sick dot codes>
# 
pkgname=riscv-gnu-toolchain
# To maintain, simply change the nightly date: https://github.com/riscv-collab/riscv-gnu-toolchain/releases
pkgver=2021.09.16
_target=11.1.0
_pkg_prefix=ubuntu-20.04-nightly
pkgrel=2
pkgdesc="GNU toolchain for RISC-V, including GCC. Includes: riscv64-unknown-elf-gcc, riscv32-unknown-elf-gcc, riscv64-unknown-linux-gnu-gcc, and riscv32-unknown-linux-gnu-gcc."
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(${pkgname} 
  riscv32-unknown-elf-gcc-11.1.0 riscv32-unknown-elf-size riscv32-unknown-elf-run riscv32-unknown-elf-objdump riscv32-unknown-elf-nm riscv32-unknown-elf-gdb-add-index riscv32-unknown-elf-c++filt riscv32-unknown-elf-addr2line riscv32-unknown-elf-gcc-nm riscv32-unknown-elf-readelf riscv32-unknown-elf-lto-dump riscv32-unknown-elf-gcc riscv32-unknown-elf-ld.bfd riscv32-unknown-elf-ranlib riscv32-unknown-elf-gcov-tool riscv32-unknown-elf-ld riscv32-unknown-elf-gcc-ar riscv32-unknown-elf-gdb riscv32-unknown-elf-gcov riscv32-unknown-elf-as riscv32-unknown-elf-gcov-dump riscv32-unknown-elf-objcopy riscv32-unknown-elf-gcc-ranlib riscv32-unknown-elf-strip riscv32-unknown-elf-c++ riscv32-unknown-elf-cpp riscv32-unknown-elf-strings riscv32-unknown-elf-ar riscv32-unknown-elf-elfedit riscv32-unknown-elf-gprof riscv32-unknown-elf-g++
  riscv64-unknown-elf-gcc-11.1.0 riscv64-unknown-elf-size riscv64-unknown-elf-run riscv64-unknown-elf-objdump riscv64-unknown-elf-nm riscv64-unknown-elf-gdb-add-index riscv64-unknown-elf-c++filt riscv64-unknown-elf-addr2line riscv64-unknown-elf-gcc-nm riscv64-unknown-elf-readelf riscv64-unknown-elf-lto-dump riscv64-unknown-elf-gcc riscv64-unknown-elf-ld.bfd riscv64-unknown-elf-ranlib riscv64-unknown-elf-gcov-tool riscv64-unknown-elf-ld riscv64-unknown-elf-gcc-ar riscv64-unknown-elf-gdb riscv64-unknown-elf-gcov riscv64-unknown-elf-as riscv64-unknown-elf-gcov-dump riscv64-unknown-elf-objcopy riscv64-unknown-elf-gcc-ranlib riscv64-unknown-elf-strip riscv64-unknown-elf-c++ riscv64-unknown-elf-cpp riscv64-unknown-elf-strings riscv64-unknown-elf-ar riscv64-unknown-elf-elfedit riscv64-unknown-elf-gprof riscv64-unknown-elf-g++
  riscv32-unknown-linux-gnu-lto-dump riscv32-unknown-linux-gnu-cpp riscv32-unknown-linux-gnu-ar riscv32-unknown-linux-gnu-run riscv32-unknown-linux-gnu-strings riscv32-unknown-linux-gnu-ld riscv32-unknown-linux-gnu-gcc riscv32-unknown-linux-gnu-gcc-ar riscv32-unknown-linux-gnu-nm riscv32-unknown-linux-gnu-addr2line riscv32-unknown-linux-gnu-readelf riscv32-unknown-linux-gnu-gcc-ranlib riscv32-unknown-linux-gnu-g++ riscv32-unknown-linux-gnu-gcc-11.1.0 riscv32-unknown-linux-gnu-elfedit riscv32-unknown-linux-gnu-as riscv32-unknown-linux-gnu-objcopy riscv32-unknown-linux-gnu-gcov-dump riscv32-unknown-linux-gnu-size riscv32-unknown-linux-gnu-ranlib riscv32-unknown-linux-gnu-gdb-add-index riscv32-unknown-linux-gnu-strip riscv32-unknown-linux-gnu-objdump riscv32-unknown-linux-gnu-c++filt riscv32-unknown-linux-gnu-gcc-nm riscv32-unknown-linux-gnu-gcov riscv32-unknown-linux-gnu-ld.bfd riscv32-unknown-linux-gnu-gfortran riscv32-unknown-linux-gnu-gprof riscv32-unknown-linux-gnu-c++ riscv32-unknown-linux-gnu-gcov-tool riscv32-unknown-linux-gnu-gdb
  riscv64-unknown-linux-gnu-lto-dump riscv64-unknown-linux-gnu-cpp riscv64-unknown-linux-gnu-ar riscv64-unknown-linux-gnu-run riscv64-unknown-linux-gnu-strings riscv64-unknown-linux-gnu-ld riscv64-unknown-linux-gnu-gcc riscv64-unknown-linux-gnu-gcc-ar riscv64-unknown-linux-gnu-nm riscv64-unknown-linux-gnu-addr2line riscv64-unknown-linux-gnu-readelf riscv64-unknown-linux-gnu-gcc-ranlib riscv64-unknown-linux-gnu-g++ riscv64-unknown-linux-gnu-gcc-11.1.0 riscv64-unknown-linux-gnu-elfedit riscv64-unknown-linux-gnu-as riscv64-unknown-linux-gnu-objcopy riscv64-unknown-linux-gnu-gcov-dump riscv64-unknown-linux-gnu-size riscv64-unknown-linux-gnu-ranlib riscv64-unknown-linux-gnu-gdb-add-index riscv64-unknown-linux-gnu-strip riscv64-unknown-linux-gnu-objdump riscv64-unknown-linux-gnu-c++filt riscv64-unknown-linux-gnu-gcc-nm riscv64-unknown-linux-gnu-gcov riscv64-unknown-linux-gnu-ld.bfd riscv64-unknown-linux-gnu-gfortran riscv64-unknown-linux-gnu-gprof riscv64-unknown-linux-gnu-c++ riscv64-unknown-linux-gnu-gcov-tool riscv64-unknown-linux-gnu-gdb
)
depends=()
optdepends=()
makedepends=(curl python3 libmpc mpfr gmp texinfo gperf libtool patchutils bc zlib expat)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${pkgver}/riscv32-elf-${_pkg_prefix}-${pkgver}-nightly.tar.gz"
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${pkgver}/riscv32-glibc-${_pkg_prefix}-${pkgver}-nightly.tar.gz"
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${pkgver}/riscv64-elf-${_pkg_prefix}-${pkgver}-nightly.tar.gz"
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/${pkgver}/riscv64-glibc-${_pkg_prefix}-${pkgver}-nightly.tar.gz"
)
# skipping shasums due to size
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  rm -rf "${srcdir}"/riscv/sysroot
  rm -rf "${srcdir}"/riscv/riscv64-unknown-linux-gnu
  rm -rf "${srcdir}"/riscv/riscv32-unknown-linux-gnu
  rm -rf "${srcdir}"/riscv/riscv64-unknown-elf
  rm -rf "${srcdir}"/riscv/riscv32-unknown-elf

  install -dm755 ${pkgdir}/usr/libexec
  install -dm755 ${pkgdir}/usr/share
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/lib

  cp -pvr "${srcdir}"/riscv/libexec/* "${pkgdir}"/usr/libexec/
  cp -pvr "${srcdir}"/riscv/share/* "${pkgdir}"/usr/share/
  cp -pvr "${srcdir}"/riscv/bin/* "${pkgdir}"/usr/bin/
  cp -pvr "${srcdir}"/riscv/lib/* "${pkgdir}"/usr/lib/

  # strip host binaries
  find "${pkgdir}"/usr/bin/ "${pkgdir}"/usr/lib/gcc/ -type f -and \( -executable \) -exec strip '{}' \;

  # Remove existing conflicts
  rm -rf "${pkgdir}"/usr/share/man/man7
  rm -rf "${pkgdir}"/usr/lib/libcc1.so*
  rm -rf "${pkgdir}"/usr/lib/bfd-plugins/libdep.so
  rm -rf "${pkgdir}"/usr/share/gcc-11.1.0/python/libstdcxx
  rm -rf "${pkgdir}"/usr/share/gdb/python/gdb
  rm -rf "${pkgdir}"/usr/share/gdb/syscalls
  rm -rf "${pkgdir}"/usr/share/gdb/system-gdbinit
  rm -rf "${pkgdir}"/usr/share/info

}
