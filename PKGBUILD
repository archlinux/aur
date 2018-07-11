# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=debugedit
pkgver=4.13.0.1
pkgrel=1
pkgdesc="Tool to mangle source locations in .debug files"
arch=('x86_64')
url="http://www.rpm.org/"
license=('GPL')
depends=('rpm-org')
source=()

package() {
	mkdir -p ${pkgdir}/usr/bin
	ln -s ../lib/rpm/debugedit ${pkgdir}/usr/bin
}
