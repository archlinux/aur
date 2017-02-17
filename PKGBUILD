# Maintainer: John K Luebs <jkluebs@luebsphoto.com>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=mma-songs
pkgver=16.06
pkgrel=1
pkgdesc="Songs archive for Musical MIDI Accompaniment (MMA)"
url="http://www.mellowood.ca/mma/"
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --user-agent Mozilla/4.0 -o %o %u ')
depends=()
license=('GPL')
arch=('any')
source=(http://www.mellowood.ca/mma/examples/mma-songs-$pkgver.tar.gz)
sha1sums=('2ff2a2c582da317f1cc836c1bacff203fe6386e3')
options=(!strip !zipman)

package () {
   mkdir -p $pkgdir/usr/share/mma/songs
   cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/mma/songs
}
