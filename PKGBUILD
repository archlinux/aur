# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot-bin
pkgver=0.0.17
pkgrel=1
pkgdesc="Tool to export Factorio saves as zoomable HTML maps (binary release)"
arch=(x86_64)
url="https://github.com/Palats/mapshot"
license=('Apache')
depends=('glibc')
provides=('mapshot')
conflicts=('mapshot')
source=("https://github.com/Palats/mapshot/releases/download/$pkgver/mapshot-linux")
sha256sums=('ff34ecd7c502861eea747fc876001d6f7eb6628dce71996c73f07fb8039fc6d9')

package() {
  install -Dm755 "mapshot-linux" "$pkgdir/usr/bin/mapshot"
}
