# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

_pkgname=podcastparser
pkgname=python2-$_pkgname
pkgver=0.6.1
pkgrel=1
pkgdesc="podcast parser for gpodder"
arch=('any')
url="http://gpodder.org/podcastparser/"
license=('ISC')
depends=('python2')
conflicts=('')
source=(http://gpodder.org/podcastparser/podcastparser-$pkgver.tar.gz)
md5sums=('b2a33d34d6ff66660a38daf0e857d8f6')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
