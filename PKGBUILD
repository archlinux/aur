# Maintainer: Andrew Titmuss <andrew@coffeetocode.me>
pkgname=gpmdp-remote
pkgver=1.1
pkgrel=1
pkgdesc="Bash script for printing info from Google Play Music Desktop Player"
arch=('any')
url="https://github.com/iandrewt/gpmdp-remtoe"
license=('MIT')
depends=('gpmdp')
install=$pkgname.install
source=(https://github.com/iandrewt/gpmdp-remote/archive/v$pkgver.tar.gz)
sha256sums=('9c709da8f74cfc4d9a8168b97af76f45332cd3756ada4779d0926e58cfdebb96')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
