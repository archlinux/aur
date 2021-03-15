# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=1.9.0
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=()
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3c5519a781beb2261ee73b2d193bef6f212697636f204acd7d58cd986ba88e30')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:ts=2:sw=2:et:
