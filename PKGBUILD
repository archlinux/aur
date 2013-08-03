# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: John K Luebs <jkluebs@luebsphoto.com>

pkgname=mma-songs
pkgver=12.10
pkgrel=1
pkgdesc="Songs archive for Musical MIDI Accompaniment (MMA)"
url="http://www.mellowood.ca/mma/"
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --user-agent "Mozilla/4.0" -o %o %u ')
depends=()
license=('GPL')
arch=('any')
source=(http://www.mellowood.ca/mma/examples/mma-songs-$pkgver.tar.gz)
md5sums=('3cb37b70f647c5293bc6aaa1ce0e6542')
options=(!strip !zipman)
package () {
   mkdir -p $pkgdir/usr/share/mma/songs
   cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/mma/songs
}
