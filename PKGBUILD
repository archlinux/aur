# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.24.11
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('blpapi_cpp')
makedepends=('python-setuptools')
source=("https://blpapi.bloomberg.com/repository/releases/python/blpapi-$pkgver.tar.gz")
sha256sums=('94dc699df262187b3afe4f163526aac67fb5982b008efe851836e9f1cd5358c1')

package() {
  cd "$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
