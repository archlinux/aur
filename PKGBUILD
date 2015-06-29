# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-00-mazda-rx7-rz
pkgver=2013_11_05
pkgrel=1
pkgdesc='2000 Mazda RX-7 Type RZ car model for Racer (CG version) by Nick Murdoch'
arch=('any')
license=(custom)
url='http://nmurdoch.ca/racer.html'
depends=('racer-cg')
source=("http://nmurdoch.ca/7z/mazda_rx7-2013-11-05.7z")
md5sums=('32643a79c209d4da29b2a9d8fa2fcffc')

package(){
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/mazda_rx7" "$pkgdir/opt/racer-cg/cars/"
}
