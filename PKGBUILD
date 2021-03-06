# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=rebind-devices
pkgver=1.2
pkgrel=1
pkgdesc="Linux service to automatically reset devices when resuming from sleep"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('2d35bf8853fe3a0818e19dd75e19000d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
