# Maintainer: Jeremy Pope <jpope@jpope.org>
pkgname=mpdrand
pkgver=0.4
pkgrel=1
pkgdesc="A script for picking random songs and adding them to the current MPD playlist."
url='https://code.jpope.org/jpope/mpdrand'
license=('WTFPL')
arch=('any')
depends=('mpc' 'ncurses' 'bash')
optdepends=('mpd')
makedepends=('git')
provides=('mpdrand')
source=("https://code.jpope.org/jpope/mpdrand/archive/v${pkgver}.tar.gz")
sha256sums=('6a7b6a2418c0a031057f672914ab4c71f30ae99034e70d38ec429f0dfb4895a8')

package() {
  mkdir -p $pkgdir/usr/share/doc/mpdrand
  mkdir -p $pkgdir/usr/local/bin
  cp $srcdir/$pkgname/mpdrand.example.conf $pkgdir/usr/share/doc/mpdrand/
  cp $srcdir/$pkgname/README.md $pkgdir/usr/share/doc/mpdrand/
  cp $srcdir/$pkgname/mpdrand $pkgdir/usr/local/bin/
}
