# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=mojave-ct-icon-theme
pkgver=0.9.8
pkgrel=3
pkgdesc="macOs Mojave icon pack by zayronxio"
url="https://github.com/zayronxio/Mojave-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Mojave-CT/archive/$pkgver.zip")
sha512sums=('725581101f6cb5ec42356ca555c5f7ef54a377912ba9b5dc24a56e1b97b3cda16aab3fb2268ad1d5ef26fc1cbccc4a561aa95013427495e89e81e3d76ca085ec')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave-CT-$pkgver" "$_instdir/mojave-ct"
}

