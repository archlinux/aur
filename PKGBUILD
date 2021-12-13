pkgname=python-sphinxcontrib-plantuml
_pyname=sphinxcontrib-plantuml
pkgver=0.22
pkgrel=2
arch=(any)
pkgdesc="Sphinx 'plantuml' extension"
url='https://pypi.python.org/pypi/sphinxcontrib-plantuml'
license=('BSD')
makedepends=(python-setuptools)
depends=('plantuml' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/s/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('a42c7a13ab1ae9ed18e8e8b0f76b8d35dc476fdebe6e634354fe6fd0f261f686')

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

package() {
  cd $_pyname-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
