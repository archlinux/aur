# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=macos-sierra-ct-icon-theme
_upstream_version=0.8.1
pkgver="v$_upstream_version"
pkgrel=2
pkgdesc="macOs Sierra icon pack by zayronxio"
url="https://github.com/zayronxio/Macos-sierra-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Macos-sierra-CT/archive/$pkgver.zip")
md5sums=('bfa6ae8dd274447ba1f9e4db489ae2ad')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p $_instdir
  cp -dpr --no-preserve=ownership "$srcdir/Macos-sierra-CT-$_upstream_version" "$_instdir/macos-sierra-ct"
}

