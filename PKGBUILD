# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-cligj
_pyname=cligj
pkgver=0.6.0
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

sha256sums=('a5f080858fd584d73fcc2b75f80ed05054130944e2283019d1828a6deb9e4110')
