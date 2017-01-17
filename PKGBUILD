# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=python2-pytvmaze
_pkgname=pytvmaze
pkgver=2.0.8
pkgrel=1
pkgdesc="Python interface to the TV Maze API "
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=('python2' 'python2-requests')
makedepends=(python2-distribute)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('562f807f97b1c626d9d9ab090195ba7b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
