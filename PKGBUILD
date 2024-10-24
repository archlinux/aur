# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot-bin
pkgver=0.0.23
pkgrel=1
pkgdesc="Tool to export Factorio saves as zoomable HTML maps (binary release)"
arch=(x86_64)
url="https://github.com/Palats/mapshot"
license=('Apache')
depends=('glibc')
optdepends=('factorio: The game in some form is required for rendering maps')
provides=('mapshot')
conflicts=('mapshot')
_binname=${pkgname%-bin}
source=("$_binname-$pkgver::https://github.com/Palats/mapshot/releases/download/$pkgver/mapshot-linux")
sha256sums=('0c69742a4212b3828217a953405c50e50c9f69fd5c49117ce7946dd0ed30bad4')

package() {
  install -Dm755 "$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
}
