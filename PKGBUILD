# Maintainer: Florian RICHER <florian.richer@protonmail.com>

pkgname='falchion-shutdown'
pkgver=1.0.0
pkgrel=1
pkgdesc='Add hwdb configuration to avoid shutdown or sleeping computer when keyboard go to sleep'
license=('MIT')
arch=('any')

source=("99-asus-falchion.hwdb")
sha256sums=("5b8649abbd0472dd4167522409a176067ba6ec6c3b271ef98f4a2bbdc38070ba")

install=falchion.install

package () {
	mkdir -p $pkgdir/etc/udev/hwdb.d
	cp $srcdir/99-asus-falchion.hwdb $pkgdir/etc/udev/hwdb.d/99-asus-falchion.hwdb
}
