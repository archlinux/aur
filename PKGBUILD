# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=edir
pkgver=1.2
pkgrel=1
pkgdesc="Program to rename and remove files and directories using your editor"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.5")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('a87c6675d11ddc62188cb2767c32eb524938dc6a')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
