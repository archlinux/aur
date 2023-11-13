# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-arch.tar.gz")
sha256sums=("1c109a39e03f4c2031ced14f215eb2e720221be58c529d605098733d6011010e")

package() {
  install -Dm755 "$srcdir/hcclient-$pkgver" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
