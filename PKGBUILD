# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-pytvmaze
_pkgname=pytvmaze
pkgver=1.4.3
pkgrel=1
pkgdesc="Python interface to the TV Maze API "
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('37f7a85cd0bca8fce0be701c331b0431')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
