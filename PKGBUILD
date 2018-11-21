# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-core-components
_pkgname=dash_core_components
pkgver=0.38.0
pkgrel=1
pkgdesc="Dash UI core components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
checkdepends=('python-dash')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2c28f4a5e2ec68d21c07105025a148bcdf62136dcdb8b3846cd6782d6d577a8d')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
