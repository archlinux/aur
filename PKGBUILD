pkgname='python-pythonz-bd'
pkgver=1.10.1
pkgrel=1
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython (berdario branch)"
url="https://github.com/berdario/pythonz"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
conflicts=('python-pythonz')
source=("https://pypi.python.org/packages/source/p/pythonz-bd/pythonz-bd-${pkgver}.tar.gz")

package() {
  cd "$srcdir/pythonz-bd-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

md5sums=('8f5f94461b2547716654ab720fc2d18b')
