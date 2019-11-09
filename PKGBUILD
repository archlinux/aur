# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=edir
pkgver=1.4
pkgrel=1
pkgdesc="Program to rename and remove files and directories using your editor"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.5")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('a2707e0e2646157d9df7ebfd6310a79893861e3b')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
