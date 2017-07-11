# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=0.7.3
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/2f/84/6a7c8359fb36bf0f53af754fda66507fc10cfc2d8852bf2f0fcb87e9e23f/dash_renderer-$pkgver.tar.gz")
sha256sums=('4c3247fe18cf99d4c66218822f501a6cf617c88d0b8b13da537ea255628095cc')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
