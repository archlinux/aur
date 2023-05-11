# Maintainer: Florian RICHER <florian.richer@protonmail.com>

pkgname='falchion-shutdown'
pkgver=1.0.1
pkgrel=1
pkgdesc='Add hwdb configuration to avoid shutdown or sleeping computer when keyboard go to sleep'
license=('MIT')
arch=('any')

source=("99-asus-falchion.hwdb")
sha256sums=("ee408f085f6aa86744514981f4f403f0f78e4892269bf2629074dd467330a9d3")

install=falchion.install

package () {
	mkdir -p $pkgdir/etc/udev/hwdb.d
	cp $srcdir/99-asus-falchion.hwdb $pkgdir/etc/udev/hwdb.d/99-asus-falchion.hwdb
}
