# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=timesched
pkgver=1.3
pkgrel=1
pkgdesc="Python module providing a simple time event scheduler"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.4")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('6bab894702588e5e9f3618802c74d33a28df8819')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
