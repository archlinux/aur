# Maintainer: Kuzey Yanik <kuzeyyanik@gmail.com>
pkgname=doas-sudo
pkgver=1
pkgrel=1
epoch=
pkgdesc="Symlinks sudo to doas"
arch=(any)
license=('GPL')
depends=(doas)
provides=(sudo)
conflicts=(sudo)
package() {
	mkdir "$pkgdir/usr/"
	mkdir "$pkgdir/usr/bin"
	ln -s /usr/bin/doas "$pkgdir/usr/bin/sudo"
}
