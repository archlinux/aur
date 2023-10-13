# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.23.0
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('blpapi_cpp')
makedepends=('python-setuptools')
source=(https://bcms.bloomberg.com/pip/simple/blpapi/blpapi-$pkgver.tar.gz)
sha256sums=('309a8ccbca09e273e551ab342ff44bcdac74295b371857a9bdd317ca8c9ad523')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
