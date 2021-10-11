# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=paruz
pkgver=1.1.2
pkgrel=1
pkgdesc="A fzf terminal UI for paru or pacman"
arch=("any")
url="https://github.com/joehillen/paruz"
license=("UNLICENSE")
depends=("bash" "fzf")
optdepends=("paru: for AUR support")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1800e55136b2c17135a7139ae3f3f4706c60d23b957b9a92cb1d3bf2d5942123')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/paruz" "$pkgdir/usr/bin/paruz"
}
