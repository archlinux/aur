# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-2018.02-arm-v7a-linux-gnueabihf-bin
pkgver=2018.02.0
pkgrel=2
pkgdesc="OSELAS cross toolchain for ARMv7a hardfloat, pinned 2018.02 (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses' 'python36')
options=('!strip')
provides=("oselas-arm-v7a-linux-gnueabihf=${pkgver}")
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-2018.02.0-arm-v7a-linux-gnueabihf-gcc-7.3.1-glibc-2.27-binutils-2.30-kernel-4.15-sanitized_2018.02.0-0ptx1_amd64.deb")
md5sums=('852a5309893d5be8bb63135ffaad7eb5')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}

# vim: ts=4
