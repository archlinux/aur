# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-arch.tar.gz")
sha256sums=("36d178835838d97f2078a3c5e5b47c5db6ae225f037302a01179d696859b0074")

package() {
  install -Dm755 "$srcdir/hcclient-$pkgver" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
