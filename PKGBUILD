# Maintainer: Anthony Anderson <aantony4122@gmail.com>

_target=aarch64-arm-none-eabi
_ver=2019.12
pkgname=$_target-gcc-bin
pkgver=9.2
pkgrel=1
pkgdesc="A gnu toolchain for AArch64"
arch=('x86_64')
url='https://developer.arm.com'
license=('GPL')
source=("https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-a/${pkgver}-${_ver}/binrel/gcc-arm-${pkgver}-${_ver}-x86_64-aarch64-none-elf.tar.xz")

md5sums=('a6019ac8c92be55a7253eacf13e64c2a')

package() {
	echo $pkgname
	mkdir -p $pkgdir/usr
	cp -r "${srcdir}/gcc-arm-${pkgver}-${_ver}-x86_64-aarch64-none-elf/bin/." "${pkgdir}/usr/bin/"

}
