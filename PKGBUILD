# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=debugedit
pkgver=4.14.2
pkgrel=1
pkgdesc="Tool to mangle source locations in .debug files"
arch=('x86_64')
url="http://www.rpm.org/"
license=('GPL')
depends=('rpm-org')
source=()

pkgver() {
	pacman -Q rpm-org | cut -f2 -d\ | cut -f1 -d-
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	ln -s ../lib/rpm/debugedit ${pkgdir}/usr/bin
}
