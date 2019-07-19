
pkgname=python-scikit-optimize
pkgver=0.6
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="http://scikit-optimize.org/"
license=('BSD')
depends=('python-scikit-learn' 'python-matplotlib' 'python-pyaml')
makedepends=('python-setuptools')
source=("https://github.com/scikit-optimize/scikit-optimize/archive/v${pkgver}.tar.gz")
sha256sums=('5bdbb73ca344e3a8a4487ab96a9b262d882d693f1edeb8ffab003f7f97bd540b')

build() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

