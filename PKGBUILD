# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.16.1
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('blpapi_cpp')
makedepends=('python-setuptools')
source=(https://bcms.bloomberg.com/pip/simple/blpapi/blpapi-$pkgver.tar.gz)
sha256sums=('8980ef85ffb02845d8b9b8b83ac29f9355098bfda7ebb0c3076ed2b7f8e38739')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
