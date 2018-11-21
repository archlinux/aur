# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=0.15.0
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('79dfc78704125392cd1b4ddb109dbec215ac4be858ab5a9de938fc9e3d681d94')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:ts=2:sw=2:et:
