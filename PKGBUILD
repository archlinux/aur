# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-87-dodge-omni-america
pkgver=1.1
pkgrel=1
pkgdesc='1987 Dodge Omni America car model for Racer (CG version) by Harey'
arch=('any')
license=(custom)
url='http://www.racedepartment.com/threads/1987-dodge-omni-america.93506/'
depends=('racer-cg')
makedepends=('unrar')
download="87DodgeOmniAmerica.rar"
source=("https://yihmwq.dm2301.livefilestore.com/y2p_3yyy4pQFQmoN8GhOo77B6QvoEEO37o0JTTreQBlPpdYfxb8TlBb6bDHtvQTzK7AIg5WwJ_MrMqjGwL9p_fcbICbkHOn-i3F34N19GoOHbM/${download}")
md5sums=('d343e44ee0acd3b1b57373db4adcf5d6')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	mv "$srcdir/readme.txt" "$srcdir/87dodgeomni/"
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/87dodgeomni" "$pkgdir/opt/racer-cg/cars/"
}
