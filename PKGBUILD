# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-pytvmaze
_pkgname=pytvmaze
pkgver=2.0.7
pkgrel=1
pkgdesc="Python interface to the TV Maze API "
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=('python2' 'python2-requests')
makedepends=(python2-distribute)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('803f822a2335b17824333fe5500db9e2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
