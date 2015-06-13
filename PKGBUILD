# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=albumbler
pkgver=20110511
pkgrel=2
pkgdesc="Like StumbleUpon for your music, it learns what you don't like."
arch=('any')
url="http://kmkeen.com/albumbler/"
license=('GPL')
depends=('python2')
optdepends=('mocp: for music' \
            'cmus: for music' \
            'mpd: for music')
source=(http://kmkeen.com/$pkgname/$pkgname)
md5sums=('948cc2e77f49eb5263aa688f321ceb44')

package	() {
  cd "$srcdir"
  install -D -m 0755 albumbler "$pkgdir/usr/bin/albumbler"
}

