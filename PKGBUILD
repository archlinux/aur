# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("$pkgname")
depends=()
source=("hcclient-$pkgver-arch.tar.gz::$url/releases/download/v$pkgver/hcclient-$pkgver-arch.tar.gz")
sha256sums=('1f8eff7639424898c3baf700a64113ed9206e8755df69d8d620c72ed038d7761')

package() {
  install -Dm755 "$srcdir/hcclient-$pkgver" "$pkgdir/usr/bin/hcclient"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/hcclient/LICENSE"
}
