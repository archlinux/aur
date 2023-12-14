# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gocryptfs-ui
pkgver=1.3
pkgrel=1
pkgdesc="Encrypted filesystem gocryptfs UI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("gocryptfs" "fuse2" "zenity" "xdg-utils")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('08d255306299dfc5b1ba761f6be11fad')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
