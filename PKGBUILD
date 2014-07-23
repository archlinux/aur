# Maintainer: John K Luebs <jkluebs@luebsphoto.com>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=mma-songs
pkgver=14.07
pkgrel=1
pkgdesc="Songs archive for Musical MIDI Accompaniment (MMA)"
url="http://www.mellowood.ca/mma/"
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --user-agent "Mozilla/4.0" -o %o %u ')
depends=()
license=('GPL')
arch=('any')
source=(http://www.mellowood.ca/mma/examples/mma-songs-$pkgver.tar.gz)
sha1sums=('9a2e0f4f483e714e3e0646c15494fe3b692c7d31')
options=(!strip !zipman)

package () {
   mkdir -p $pkgdir/usr/share/mma/songs
   cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/mma/songs
}
