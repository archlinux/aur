# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=paruz
pkgver=1.1.0
pkgrel=0
pkgdesc="A fzf terminal UI for paru or pacman"
arch=("any")
url="https://github.com/joehillen/paruz"
license=("UNLICENSE")
depends=("bash" "fzf")
optdepends=("paru: for AUR support")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e1806f446e8d88df2c648ac3502d6842c837588b42a38fb652d576def7bc56c6')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/paruz" "$pkgdir/usr/bin/paruz"
}
