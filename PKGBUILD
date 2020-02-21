# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-2018.12-arm-v7a-linux-gnueabihf-bin
pkgver=2018.12.0
pkgrel=2
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat, pinned 2018.12 (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses' 'python37')
options=('!strip')
provides=("oselas-arm-v7a-linux-gnueabihf=${pkgver}")
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-2018.12.0-arm-v7a-linux-gnueabihf-gcc-8.2.1-glibc-2.28-binutils-2.31.1-kernel-4.19-sanitized_2018.12.0-1_amd64.deb")
md5sums=('1e24e609ece53722f4d10551d1b19a43')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}

# vim: ts=4
