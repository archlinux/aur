# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.24.6
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('blpapi_cpp')
makedepends=('python-setuptools')
source=("https://blpapi.bloomberg.com/repository/releases/python/blpapi-$pkgver.tar.gz")
sha256sums=('cc005116c759bce388eeaff3727d756433c8cf56a3da4f591f6094e168ecf066')

package() {
  cd "$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
