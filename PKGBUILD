# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-2014.12-arm-v7a-linux-gnueabihf-bin
pkgver=2014.12.2
pkgrel=2
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat, pinned 2014.12 (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-arm-v7a-linux-gnueabihf=${pkgver}")
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-2014.12.2-arm-v7a-linux-gnueabihf-gcc-4.9.2-glibc-2.20-binutils-2.24-kernel-3.16-sanitized_2014.12.2_amd64.deb")
md5sums=('f1b1436701bbfa26a92c2219929f11b3')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}

# vim: ts=4
