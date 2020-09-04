pkgname=python-pgmpy
pkgver=0.1.11
pkgrel=1
pkgdesc="A library for Probabilistic Graphical Models"
arch=(any)
url="https://github.com/pgmpy/pgmpy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-pandas' 'python-scipy' 'python-pyparsing' 'python-wrapt')
source=("https://pypi.io/packages/source/p/pgmpy/pgmpy-$pkgver.tar.gz")
sha256sums=('1a0081ad3282099e5343ad3455efe099fbe1d77598bc2f27cdcd848b0c2fe5d8')

build() {
  cd pgmpy-$pkgver
  python setup.py build
}

package() {
  cd pgmpy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
