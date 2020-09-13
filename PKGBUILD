# Maintainer: Max Wölfing <ff0x@this-is-fine.io>
pkgname=tifig-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Converts iOS 11 HEIC images to practical formats - Static binary'
arch=(x86_64)
license=('Apache License 2.0')
url='https://github.com/monostream/tifig'
source=("$pkgname-$pkgver.tar.gz::https://github.com/monostream/tifig/releases/download/$pkgver/tifig-static-$pkgver.tar.gz")
md5sums=('364b11d73e75f9374c30f6f8bf413517')
conflicts=('tifig-git')

package() {
  install -Dm755 "$srcdir/tifig" "$pkgdir/usr/bin/tifig"
}
