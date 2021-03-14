
pkgname=python-scikit-optimize
pkgver=0.8.1
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="https://scikit-optimize.github.io"
license=('BSD')
depends=('python-scikit-learn' 'python-matplotlib' 'python-pyaml')
makedepends=('python-setuptools')
source=("https://github.com/scikit-optimize/scikit-optimize/archive/v${pkgver}.tar.gz")
sha256sums=('0573037eca0b609be5ac190d4de7d80d79f2531743fab34a8040a9f78034c927')

build() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

