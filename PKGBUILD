# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-90-renault-clio-i
pkgver=1.0
pkgrel=3
pkgdesc='1990 Renault Clio I car model for Racer (CG version) by Skybh'
arch=('any')
license=(custom)
url='https://web.archive.org/web/20160924225028/http://skybh.jimdo.com:80/t%C3%A9l%C3%A9chargements/racer/renault'
depends=('racer-cg')
makedepends=('unrar')
download="renault_clio_i.rar"
source=("https://www.tracciontrasera.net/descargas/racer/coches/renault_clio_i.rar")
md5sums=('25418cb781483cdbf9da9413ac641775')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/renault_clio_i" "$pkgdir/opt/racer-cg/cars/"
}
