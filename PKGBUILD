# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-28-bentley-blower
pkgver=1.0
pkgrel=1
pkgdesc='1928 Bentley Blower 4.5l car model for Racer (CG version) by Harey'
arch=('any')
license=(custom)
url='http://hareysblog.blogspot.de/2013/09/lost-dazed-but-not-confused.html'
depends=('racer-cg')
makedepends=('unrar')
download="bentley_blower.rar"
source=("https://9yrxtq.by3301.livefilestore.com/y2pnNlOwwhGqh2kwYuusDbA41iKsaERq17ZX-qNnFKDN-XBpwNOS1gxhZgRpj-0-wiiYccfFdGSWE1PD1FfTkQ2TCiX3e_EEo-_EWsY8kqKkzc//${download}")
md5sums=('5a65ad2a2fd6d32698633d2a7030a5d0')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	mv "$srcdir/README.txt" "$srcdir/bentley_blower/"
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/bentley_blower" "$pkgdir/opt/racer-cg/cars/"
}
