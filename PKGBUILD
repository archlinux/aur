pkgname='python-pythonz'
pkgver=1.11.0
pkgrel=1
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython"
url="https://github.com/saghul/pythonz"
arch=('any')
license=('MIT')
depends=('python' 'python-resumable-urlretrieve')
makedepends=('python' 'python-setuptools')
source=("https://github.com/saghul/pythonz/archive/pythonz-$pkgver.tar.gz")

package() {
  cd "$srcdir/pythonz-pythonz-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

md5sums=('a110750833e973adde144c292a7a3ee9')
