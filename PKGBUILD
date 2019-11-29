# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.12.2
pkgrel=1
pkgdesc="Python binding to the Bloomberg SDK (BLPAPI)"
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=('python' 'blpapi_cpp')
source=(https://bloomberg.bintray.com/pip/simple/blpapi/$_pkgname-$pkgver.tar.gz)
sha256sums=('d6676adcfb2e8e9fd3a485525b7efd5634cec94d783bdfe3d3f49e3fa31b4a4e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
