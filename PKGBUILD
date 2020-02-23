# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=1.2.4
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('74aab93b6332290d9bff5f81060a5c4cbf0c393f8ccff85b2edb1ae976bdd5f0')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:ts=2:sw=2:et:
