# Maintainer: Alexander Koch <lynix47@gmail.com>

pkgname=oselas-2014.12-arm-1136jfs-linux-gnueabihf-bin
pkgver=2014.12.2
pkgrel=1
pkgdesc="OSELAS cross toolchain for ARM1136JF-S hardfloat, pinned 2014.12 (from Debian package)"
arch=('x86_64')
url="https://www.pengutronix.de/en/software/toolchain.html"
license=('GPL')
depends=('ncurses')
options=('!strip')
provides=("oselas-arm-1136jfs-linux-gnueabihf=${pkgver}")
source=("https://debian.pengutronix.de/debian/pool/main/o/oselas.toolchain/oselas.toolchain-2014.12.1-arm-1136jfs-linux-gnueabihf-gcc-4.9.2-glibc-2.20-binutils-2.24-kernel-3.16-sanitized_2014.12.1_amd64.deb")
md5sums=('0896a082d96f612be77d6524c11613dc')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}

# vim: ts=4
