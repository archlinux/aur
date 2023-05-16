# Maintainer: Hoream <2175223953@qq.com>
pkgname=totalmapper-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple utility for remapping keys using the Linux event handling system."
arch=(x86_64)
url="https://github.com/ellbur/totalmapper"
license=('GPL3')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("totalmapper-static-linux-amd64-$pkgver.tar.gz::https://github.com/ellbur/totalmapper/releases/download/v$pkgver/totalmapper-static-linux-amd64-$pkgver.tar.gz")
sha512sums=('18e5ca7f6744854caa64678606d9d80c4cabcb0296db5d0fd30e1a92caaca28aeaa00851f9e93489f300030b9f16c374823e140861e83b0e41760128c2833fb2')

package() {
  install -Dm755 "totalmapper-static-linux-amd64-$pkgver/totalmapper" "$pkgdir/usr/bin/totalmapper"
}
