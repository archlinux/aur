# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-core-components
_pkgname=dash_core_components
pkgver=1.12.1
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
sha256sums=('27f2ac612f5574dcd0d645f9302ceca5975bbdac6791865692e3ac51d0aec7f4')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
