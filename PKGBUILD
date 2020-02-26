
pkgname=python-scikit-optimize
pkgver=0.7.4
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="http://scikit-optimize.org/"
license=('BSD')
depends=('python-scikit-learn' 'python-matplotlib' 'python-pyaml')
makedepends=('python-setuptools')
source=("https://github.com/scikit-optimize/scikit-optimize/archive/v${pkgver}.tar.gz")
sha256sums=('c38dcea26ebcfa0877f0b6f7138d9e992ac738dc95ce7f689799ae0fd9fa607e')

build() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

