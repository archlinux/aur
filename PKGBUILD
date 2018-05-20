# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=b2restore
pkgver=1.5
pkgrel=1
pkgdesc="Program to recreate Backblaze B2 file archive at specified date+time."
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
backup=("etc/$pkgname.conf")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('299075e2080b5798e56713e1461aa5c4')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
