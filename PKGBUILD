# Maintainer: Jan Magnus Brevik <janmbrevik@gmail.com>

_pkgname=podcastparser
pkgname=python2-$_pkgname
pkgver=0.6.1
pkgrel=2
pkgdesc="podcast parser for gpodder"
arch=('any')
url="https://github.com/gpodder/podcastparser"
license=('ISC')
depends=('python2')
conflicts=('')
source=(https://github.com/gpodder/podcastparser/archive/$pkgver.tar.gz)
md5sums=('294cb1cdc934aac7ade67ac24ea10cc4')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
