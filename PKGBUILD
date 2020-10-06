pkgname=python-pgmpy
pkgver=0.1.12
pkgrel=1
pkgdesc="A library for Probabilistic Graphical Models"
arch=(any)
url="https://github.com/pgmpy/pgmpy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-pandas' 'python-scikit-learn' 'python-pyparsing' 'python-statsmodels' 'python-tqdm' 'python-pyparsing' 'python-pytorch')
source=("https://pypi.io/packages/source/p/pgmpy/pgmpy-$pkgver.tar.gz")
sha256sums=('ff5b8b8ef3c22642a499d6b1633035800185de4628fb380f9fb78db08f71b7e4')

build() {
  cd pgmpy-$pkgver
  python setup.py build
}

package() {
  cd pgmpy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
