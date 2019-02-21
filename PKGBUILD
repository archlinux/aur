# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=mojave-ct-icon-theme
_upstream_version=0.9.7
pkgver="v$_upstream_version"
pkgrel=2
pkgdesc="macOs Mojave icon pack by zayronxio"
url="https://github.com/zayronxio/Mojave-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Mojave-CT/archive/$pkgver.zip")
sha512sums=('85b75ea878ffb9802c25b7e0ac5e9cc089c56c0c79deb8ad395a6aae9572d380a47c84580ccd8af9172486bc1a691b58328ede670de87c593967b5a596ba082d')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave-CT-$_upstream_version" "$_instdir/mojave-ct"
}

