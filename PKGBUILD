# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-64-austin-mini
pkgver=BETA
pkgrel=3
pkgdesc='1964 Austin Mini MK1 car model for Racer (CG version) by Harey'
arch=('any')
license=(custom)
url='https://www.racedepartment.com/threads/1964-austin-mini-beta.62339/'
depends=('racer-cg')
makedepends=('unrar')
download="austin_mini.rar"
source=("http://www.tracciontrasera.net/descargas/racer/coches/austin_mini.rar")
md5sums=('9cb98afa2794612de4e532d750aee33c')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	mv "$srcdir/README.txt" "$srcdir/austin_mini/"
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/austin_mini" "$pkgdir/opt/racer-cg/cars/"
}
