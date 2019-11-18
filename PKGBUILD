# Maintainer: Graviton Research Capital LLP <archlinux@gravitonresearch.com>

pkgname=python-blpapi
_pkgname=blpapi
pkgver=3.12.2
pkgrel=1
pkgdesc="The Bloomberg API (BLPAPI) is a set of freely available software development kits (SDKs) that allow software developers to create applications that consume market data. Python SDK."
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
idepends=('python' 'blpapi_cpp')
source=(https://bloomberg.bintray.com/pip/simple/blpapi/$_pkgname-$pkgver.tar.gz)
sha256sums=('d6676adcfb2e8e9fd3a485525b7efd5634cec94d783bdfe3d3f49e3fa31b4a4e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  BLPAPI_ROOT=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
