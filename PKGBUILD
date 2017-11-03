pkgname='python-pythonz-bd'
pkgver=1.11.4
pkgrel=1
pkgdesc="Python installation manager supporting CPython, Stackless, PyPy and Jython (berdario branch)"
url="https://github.com/berdario/pythonz"
arch=('any')
license=('MIT')
depends=('python' 'python-resumable-urlretrieve')
makedepends=('python' 'python-setuptools')
conflicts=('python-pythonz')
source=("https://github.com/berdario/pythonz/archive/pythonz-${pkgver}.zip")
optdepends=('libtinfo: for running pypy')

package() {
  cd "$srcdir/pythonz-pythonz-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py build
  LANG=en_US.UTF-8 python3 setup.py install --prefix=/usr --root="$pkgdir"
}

md5sums=('1f94e370354835aa83230c1d3a2807ca')
