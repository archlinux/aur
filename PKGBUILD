# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-core-components
_pkgname=dash_core_components
pkgver=0.18.1
pkgrel=1
pkgdesc="Dash UI core components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('96764f9c30f2348eac618b53178e0d1c5fa1cb0c7dfc41914ef2b6876e26271e')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
