# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=0.11.2
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('26e62fb0b89f217271b95b1c5a4a35f47f1197879e846382b12a7d049820b390')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
