pkgname='python-pythonz'
pkgver=1.10.0
pkgrel=1
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython"
url="https://github.com/saghul/pythonz"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://github.com/saghul/pythonz/archive/pythonz-$pkgver.tar.gz")

package() {
  cd "$srcdir/pythonz-pythonz-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

md5sums=('037f3014b96494995b252c5baf3a8bf3')
