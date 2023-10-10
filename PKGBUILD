# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot-bin
pkgver=0.0.19
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
sha256sums=('02efab8a3397a88aa1c3f233788f6379e8de6675a1d636bc88c82f17b8428e80')

package() {
  install -Dm755 "$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
}
