pkgname=python2-runsnakerun
_name=RunSnakeRun
pkgver=2.0.4
pkgrel=2
pkgdesc="GUI Viewer for Python profiling runs"
arch=('any')
url="http://www.vrplumber.com/programming/runsnakerun/"
license=('BSD')
depends=('python2-squaremap' 'wxpython')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('3220b5b89994baee70b1c24d7e42a306')


build() {
  cd "$srcdir/RunSnakeRun-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/RunSnakeRun-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1 --skip-build
}
