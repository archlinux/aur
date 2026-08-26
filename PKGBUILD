# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-arm-v7a-linux-gnueabihf-bin
pkgver=2025.11.1
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-arm-v7a-linux-gnueabihf=${pkgver}")
_gcc=15.2.1
_clang=21.1.8
_glibc=2.42
_binutils=2.45.1
_kernel=6.17.6
_debrel=1~deb13+1
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-${pkgver}-arm-v7a-linux-gnueabihf-gcc-${_gcc}-clang-${_clang}-glibc-${_glibc}-binutils-${_binutils}-kernel-${_kernel}-sanitized_${pkgver}-${_debrel}_amd64.deb")
md5sums=('0b5b8b8826543c78726b550cb44433a0')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}
