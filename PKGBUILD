# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=rebind-devices
pkgver=1.4
pkgrel=1
pkgdesc="Linux service to automatically reset devices when resuming from sleep"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('1cbc95eaa1f6bfa36a754faf78cace03')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
