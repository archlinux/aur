# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-renderer
_pkgname=dash_renderer
pkgver=1.1.2
pkgrel=1
pkgdesc="Dash front-end"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('256d177e265dd7329fd964bc2977548c292e89121e2013eedc92c6f948cdecbf')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:ts=2:sw=2:et:
