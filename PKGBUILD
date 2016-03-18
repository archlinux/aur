# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=python-cligj
pkgver=0.4.0
pkgrel=1
pkgdesc="Click params for command line interfaces to GeoJSON"
arch=('any')
url="https://github.com/mapbox/cligj"
license=('BSD')
depends=('python' 'python-click' 'python-pytest-cov')
options=(!emptydirs)
source=('https://pypi.python.org/packages/source/c/cligj/cligj-0.4.0.tar.gz')
md5sums=('b1be9e2e9a083e8ab114901645a83826')

package() {
  cd "$srcdir/cligj-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
