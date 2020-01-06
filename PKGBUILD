# Maintainer: ArchFeh <guyu2876@gmail.com>
# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=mojave-ct-icon-theme-git
pkgver=master
pkgrel=1
pkgdesc="MacOS Mojave icon pack by zayronxio git version"
url="https://github.com/zayronxio/Mojave-CT"
license=("GPL3")
arch=(any)
depends=()
source=("$pkgname-$pkgver.zip::https://github.com/zayronxio/Mojave-CT/archive/$pkgver.zip")
sha512sums=("SKIP")
package() {
	_instdir="$pkgdir/usr/share/icons"
	mkdir -p "$_instdir"
	cp -dpr --no-preserve=ownership "$srcdir/Mojave-CT-$pkgver" "$_instdir/mojave-ct"
}
