# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-core-components
_pkgname=dash_core_components
pkgver=1.10.0
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
sha256sums=('6ed00e421e4ff5ebe1bb91b0add168ef89cf2afbdff1e0cef91633dd338569c8')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
