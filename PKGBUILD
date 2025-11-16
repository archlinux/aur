# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot-bin
pkgver=0.0.28
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
sha256sums=('e2f2d72c20272f1519f736e2f5b8d84a9241894e12a9310bf06a5fc1a0828825')

package() {
  install -Dm755 "$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
}
