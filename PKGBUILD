# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-arm-v7a-linux-gnueabihf-bin
pkgver=2020.08.0
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-arm-v7a-linux-gnueabihf=${pkgver}")
_gcc=10.2.1
_clang=10.0.1
_glibc=2.32
_binutils=2.35
_kernel=5.8
_debrel=3
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-${pkgver}-arm-v7a-linux-gnueabihf-gcc-${_gcc}-clang-${_clang}-glibc-${_glibc}-binutils-${_binutils}-kernel-${_kernel}-sanitized_${pkgver}-${_debrel}_amd64.deb")
md5sums=('c9d0077f78f829a6afb85deceed79dc7')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}

# vim: ts=4
