# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.10.8
pkgrel=1
pkgdesc="Terminal client for connecting to hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-linux-x86-64-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-linux-x86-64-arch.tar.gz")
sha256sums=('e44eec44af7e4bdfeee0221faef896b6c493930fea1c203a2f9e0b5d70fc9a69')

package() {
  install -Dm755 "$srcdir/hcclient-1.10.8-linux-x86-64" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
