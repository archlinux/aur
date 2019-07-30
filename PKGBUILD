# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=mojave-ct-icon-theme
pkgver=0.9.9
pkgrel=1
pkgdesc="macOs Mojave icon pack by zayronxio"
url="https://github.com/zayronxio/Mojave-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Mojave-CT/archive/$pkgver.zip")
sha512sums=('aa5d6a7c02537d9571d21fa6dbeca4acf1218a70174da2a20b4aafbb7eae1bfbc611c17b8aa740a7f3e87508ccd5a661b9976154a9459617c094092147d41afe')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave-CT-$pkgver" "$_instdir/mojave-ct"
}

