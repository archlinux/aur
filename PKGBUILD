# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-90-renault-clio-i
pkgver=1.0
pkgrel=1
pkgdesc='1990 Renault Clio I car model for Racer (CG version) by Skybh'
arch=('any')
license=(custom)
url='http://skybh.jimdo.com/t%C3%A9l%C3%A9chargements/racer/renault/'
depends=('racer-cg')
makedepends=('unrar')
download="renault_clio_i.rar"
source=("https://yjl5vg.dm2301.livefilestore.com/y2pvu-fTLvHmz1JoPb1d8yV4V6h0WIOODtwuvHvK8wEeGhjM1RftUwc0JQ49IW-YrP0ytErYI5Zs17xKgTqzz0V_Bp6pI_AlJ9eycOmLoA9F84/${download}")
md5sums=('3252db3a4bdd0fa3c1ab0975af40f8df')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/renault_clio_i" "$pkgdir/opt/racer-cg/cars/"
}
