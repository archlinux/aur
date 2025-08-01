# Maintainer: John K Luebs <jkluebs@luebsphoto.com>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=mma-songs
pkgver=25.05.0
pkgrel=1
pkgdesc="Songs archive for Musical MIDI Accompaniment (MMA)"
url="http://www.mellowood.ca/mma/"
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --user-agent Mozilla/4.0 -o %o %u ')
depends=()
license=('GPL-2.0-or-later')
arch=('any')
source=(http://www.mellowood.ca/mma/examples/mma-songs-$pkgver.tar.gz)
sha1sums=('c7b14df31446193490b0f86d720c9c1d9daad73a')
options=(!strip !zipman)

package() {
  mkdir -p $pkgdir/usr/share/mma/songs
  cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/mma/songs
}
