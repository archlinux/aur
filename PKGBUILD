# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gocryptfs-ui
pkgver=1.5
pkgrel=1
pkgdesc="Encrypted filesystem gocryptfs UI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("gocryptfs" "fuse2" "zenity" "xdg-utils")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('5eecec41f2a78ceb1b612b78b6abe1fb')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
