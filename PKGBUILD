# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=macos-sierra-ct-icon-theme
_upstream_version=0.9.4.8
pkgver="v$_upstream_version"
pkgrel=1
pkgdesc="macOs Sierra icon pack by zayronxio"
url="https://github.com/zayronxio/Macos-sierra-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Macos-sierra-CT/archive/$pkgver.zip")
sha512sums=('4ba331a714bf1e8c86679d4576e7387dd44bbb8b3e388b1a7720f9723637d41e649aac97b39bc4f0b1ee27b9cd2bf2f7052eb5271f48732f5339812adadeb58a')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Macos-sierra-CT-$_upstream_version" "$_instdir/macos-sierra-ct"
}

