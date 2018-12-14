# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=macos-sierra-ct-icon-theme
_upstream_version=0.9
pkgver="v$_upstream_version"
pkgrel=1
pkgdesc="macOs Sierra icon pack by zayronxio"
url="https://github.com/zayronxio/Macos-sierra-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Macos-sierra-CT/archive/$pkgver.zip")
sha512sums=('24b784e5664e81af02b47c2c86168230bc255d184acbe8689bd77cec5c9f9e81a7879dfa85f9c9d1512c4dc0e3a48ecfc4b87a51b996e3637e463711d0b20dc7')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Macos-sierra-CT-$_upstream_version" "$_instdir/macos-sierra-ct"
}

