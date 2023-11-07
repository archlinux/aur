# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.10.9
pkgrel=1
pkgdesc="Terminal client for connecting to hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-arch.tar.gz")
sha256sums=("2ff77d4531689601a3d7e45ed5c9c5f4d8962c3b36a9e7f64d60aa47ad17060e")

package() {
  install -Dm755 "$srcdir/hcclient-$pkgver" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
