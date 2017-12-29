# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

_pkgname=podcastparser
pkgname=python-$_pkgname
pkgver=0.6.2
pkgrel=1
pkgdesc="podcast parser for gpodder"
arch=('any')
url="https://github.com/gpodder/podcastparser"
license=('ISC')
depends=('python')
conflicts=('')
source=(https://github.com/gpodder/podcastparser/archive/$pkgver.tar.gz)
md5sums=('fbd743f9deb0c02c1fd52161a4d6f66b')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
