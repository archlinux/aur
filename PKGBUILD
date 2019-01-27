# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=macos-sierra-ct-icon-theme
_upstream_version=0.9.6
pkgver="v$_upstream_version"
pkgrel=1
pkgdesc="macOs Sierra icon pack by zayronxio"
url="https://github.com/zayronxio/Macos-sierra-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Macos-sierra-CT/archive/$pkgver.zip")
sha512sums=('2af8db118030e8ede1d93a37dcd3ce8ba495a88af42be30c9c1516eb171ece9f32a363883f9ad7edd1fc6e6fdb5d4d1fa48058e6f6a87df8166b64223b0a3da6')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Macos-sierra-CT-$_upstream_version" "$_instdir/macos-sierra-ct"
}

