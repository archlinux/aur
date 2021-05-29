# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-cligj
_pyname=cligj
pkgver=0.7.2
pkgrel=1
pkgdesc="Click params for command line interfaces to GeoJSON"
arch=('any')
url="https://github.com/mapbox/cligj"
license=('BSD')
depends=('python' 'python-click')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/c/$_pyname/$_pyname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

sha256sums=('a4bc13d623356b373c2c27c53dbd9c68cae5d526270bfa71f6c6fa69669c6b27')
