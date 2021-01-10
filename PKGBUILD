# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-asx-fetch
pkgver=1.2
pkgrel=1
pkgdesc="Utility to fetch and add current ASX prices to one or more gnucash files"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('985b8dad8beacae3f5c6d3c52ed3380f4f0aa0fc')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
