# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-html-components
_pkgname=dash_html_components
pkgver=0.8.0
pkgrel=1
pkgdesc="Dash UI HTML components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5fe4a5966388078468a502fa1e93cf94a856ad4ae7d27022544facc0ee4e75cf')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
