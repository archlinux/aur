# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=edir
pkgver=1.0
pkgrel=1
pkgdesc="Program to rename and remove files and directories using your editor"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.5")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('e31fdecbfd223becec4032a1e50e9bdead7284cf')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
