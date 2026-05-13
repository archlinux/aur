# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.26.3.1
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('blpapi_cpp')
makedepends=('python-setuptools')
source=("https://blpapi.bloomberg.com/repository/releases/python/blpapi-$pkgver.tar.gz")
sha256sums=('984cc5986d11d106400280dd42f47c18a0ab34693961f2cc9710542db0fbe58c')

package() {
  cd "$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
