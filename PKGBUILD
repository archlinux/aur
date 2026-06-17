pkgname=riscv64-unknown-elf-symlink
pkgver=0.1
pkgrel=1
pkgdesc="Symlinks to provide riscv64-unknown-elf alias to riscv64-elf toolchain from official repos"
arch=('any')
license=('GPL3')
depends=('riscv64-elf-gcc')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/bin/riscv64-elf-addr2line"  "$pkgdir/usr/bin/riscv64-unknown-elf-addr2line"
    ln -s "/usr/bin/riscv64-elf-ar"         "$pkgdir/usr/bin/riscv64-unknown-elf-ar"
    ln -s "/usr/bin/riscv64-elf-as"         "$pkgdir/usr/bin/riscv64-unknown-elf-as"
    ln -s "/usr/bin/riscv64-elf-c++filt"    "$pkgdir/usr/bin/riscv64-unknown-elf-c++filt"
    ln -s "/usr/bin/riscv64-elf-elfedit"    "$pkgdir/usr/bin/riscv64-unknown-elf-elfedit"
    ln -s "/usr/bin/riscv64-elf-gprof"      "$pkgdir/usr/bin/riscv64-unknown-elf-gprof"
    ln -s "/usr/bin/riscv64-elf-ld"         "$pkgdir/usr/bin/riscv64-unknown-elf-ld"
    ln -s "/usr/bin/riscv64-elf-ld.bfd"     "$pkgdir/usr/bin/riscv64-unknown-elf-ld.bfd"
    ln -s "/usr/bin/riscv64-elf-nm"         "$pkgdir/usr/bin/riscv64-unknown-elf-nm"
    ln -s "/usr/bin/riscv64-elf-objcopy"    "$pkgdir/usr/bin/riscv64-unknown-elf-objcopy"
    ln -s "/usr/bin/riscv64-elf-objdump"    "$pkgdir/usr/bin/riscv64-unknown-elf-objdump"
    ln -s "/usr/bin/riscv64-elf-ranlib"     "$pkgdir/usr/bin/riscv64-unknown-elf-ranlib"
    ln -s "/usr/bin/riscv64-elf-readelf"    "$pkgdir/usr/bin/riscv64-unknown-elf-readelf"
    ln -s "/usr/bin/riscv64-elf-size"       "$pkgdir/usr/bin/riscv64-unknown-elf-size"
    ln -s "/usr/bin/riscv64-elf-strings"    "$pkgdir/usr/bin/riscv64-unknown-elf-strings"
    ln -s "/usr/bin/riscv64-elf-strip"      "$pkgdir/usr/bin/riscv64-unknown-elf-strip"
    ln -s "/usr/bin/riscv64-elf-c++"        "$pkgdir/usr/bin/riscv64-unknown-elf-c++"
    ln -s "/usr/bin/riscv64-elf-cpp"        "$pkgdir/usr/bin/riscv64-unknown-elf-cpp"
    ln -s "/usr/bin/riscv64-elf-g++"        "$pkgdir/usr/bin/riscv64-unknown-elf-g++"
    ln -s "/usr/bin/riscv64-elf-gcc"        "$pkgdir/usr/bin/riscv64-unknown-elf-gcc"
    ln -s "/usr/bin/riscv64-elf-gcc-ar"     "$pkgdir/usr/bin/riscv64-unknown-elf-gcc-ar"
    ln -s "/usr/bin/riscv64-elf-gcc-nm"     "$pkgdir/usr/bin/riscv64-unknown-elf-gcc-nm"
    ln -s "/usr/bin/riscv64-elf-gcc-ranlib" "$pkgdir/usr/bin/riscv64-unknown-elf-gcc-ranlib"
    ln -s "/usr/bin/riscv64-elf-gcov"       "$pkgdir/usr/bin/riscv64-unknown-elf-gcov"
    ln -s "/usr/bin/riscv64-elf-gcov-dump"  "$pkgdir/usr/bin/riscv64-unknown-elf-gcov-dump"
    ln -s "/usr/bin/riscv64-elf-gcov-dump"  "$pkgdir/usr/bin/riscv64-unknown-elf-gcov-tool"
    ln -s "/usr/bin/riscv64-elf-lto-dump"   "$pkgdir/usr/bin/riscv64-unknown-elf-lto-dump"
}
