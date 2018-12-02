# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=macos-sierra-ct-icon-theme
_upstream_version=0.8.6.1
pkgver="v$_upstream_version"
pkgrel=1
pkgdesc="macOs Sierra icon pack by zayronxio"
url="https://github.com/zayronxio/Macos-sierra-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Macos-sierra-CT/archive/$pkgver.zip")
sha512sums=('12cbdeb808c5e58001082df1367738eeb929e6b5df63b3e377c97f3d62961aa78b18b86b836e452abb009fe94cdf000ad7cdf4bbfd71a746e7ac4119335a9870')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Macos-sierra-CT-$_upstream_version" "$_instdir/macos-sierra-ct"
}

