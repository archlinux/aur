# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.10.10
pkgrel=2
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-arch.tar.gz")
sha256sums=("c89bff50c14b4b4f731f6ab2aa1922773f3f2f3949039074e458565507d3b20b")

package() {
  install -Dm755 "$srcdir/hcclient-$pkgver" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
