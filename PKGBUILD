# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-cligj
_pyname=cligj
pkgver=0.7.1
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

sha256sums=('b2f1f7247d59a5387bd3013a08b9ed6829e96fafa4a6e6292341efdb46fe6220')
