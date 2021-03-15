# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-core-components
_pkgname=dash_core_components
pkgver=1.15.0
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
sha256sums=('b61cb37322de91b4feb0d4d823694cbba8686f6459db774b53d553135350c71e')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
