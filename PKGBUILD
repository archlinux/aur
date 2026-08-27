# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-aarch64-v8a-linux-gnu-bin
pkgver=2025.11.1
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARMv8a hardfloat (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-aarch64-v8a-linux-gnu=${pkgver}")
_gcc=15.2.1
_clang=21.1.8
_glibc=2.42
_binutils=2.45.1
_kernel=6.17.6
_debrel=1~deb13+1
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-${pkgver}-aarch64-v8a-linux-gnu-gcc-${_gcc}-clang-${_clang}-glibc-${_glibc}-binutils-${_binutils}-kernel-${_kernel}-sanitized_${pkgver}-${_debrel}_amd64.deb")
md5sums=('88528478e200c0069d25d510e4789d0d')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}
