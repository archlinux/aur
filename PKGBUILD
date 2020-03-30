# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.14.0
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('python' 'blpapi_cpp')
source=(https://bloomberg.bintray.com/pip/simple/blpapi/$_pkgname-$pkgver.tar.gz)
sha256sums=('1d0cbccf0b316f210e847868da21fa424cf45ad63fc0cd809cda58fd730eeb50')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
