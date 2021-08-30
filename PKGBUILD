# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=paruz
pkgver=1.0.0
pkgrel=0
pkgdesc="A fzf interface terminal UI for paru or pacman"
arch=("any")
url="https://github.com/joehillen/paruz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cd7b5dbe3cc70861822c6f2a5f156b3fb7505436cf4a2374439a59cfad5cf14b')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/paruz" "$pkgdir/usr/bin/paruz"
}
