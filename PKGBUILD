# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-aarch64-v8a-linux-gnu-bin
pkgver=2024.11.1
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARMv8a hardfloat (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-aarch64-v8a-linux-gnu=${pkgver}")
_gcc=14.2.1
_clang=19.1.7
_glibc=2.40
_binutils=2.43.1
_kernel=6.11.6
_debrel=1
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-${pkgver}-aarch64-v8a-linux-gnu-gcc-${_gcc}-clang-${_clang}-glibc-${_glibc}-binutils-${_binutils}-kernel-${_kernel}-sanitized_${pkgver}-${_debrel}_amd64.deb")
md5sums=('1d6fe5d720bba1832998a373af34a8ac')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}
