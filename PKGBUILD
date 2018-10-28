pkgname=python-pgmpy
pkgver=0.1.6
pkgrel=1
pkgdesc="A library for Probabilistic Graphical Models"
arch=(any)
url="https://github.com/pgmpy/pgmpyy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-pandas' 'python-scipy' 'python-pyparsing' 'python-wrapt')
source=("https://pypi.io/packages/source/p/pgmpy/pgmpy-$pkgver.tar.gz")
sha256sums=('d7c7dd11aface5496a4462a4ff8d3c5b813b255986c89a6f5422ec001e5f5294')

build() {
  cd pgmpy-$pkgver
  python setup.py build
}

package() {
  cd pgmpy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
