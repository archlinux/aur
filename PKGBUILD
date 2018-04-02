# Maintainer: Jeremy Pope <jpope@jpope.org>
pkgname=mpdrand
pkgver=0.5
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
sha256sums=('1d4a2209550ba90668814b92ff248e842b8d29f370fcf41e54a901a3e686573e')

package() {
  mkdir -p $pkgdir/usr/share/doc/mpdrand
  mkdir -p $pkgdir/usr/local/bin
  cp $srcdir/$pkgname/mpdrand.example.conf $pkgdir/usr/share/doc/mpdrand/
  cp $srcdir/$pkgname/README.md $pkgdir/usr/share/doc/mpdrand/
  cp $srcdir/$pkgname/mpdrand $pkgdir/usr/local/bin/
}
