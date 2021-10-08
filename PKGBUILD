# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=paruz
pkgver=1.1.1
pkgrel=1
pkgdesc="A fzf terminal UI for paru or pacman"
arch=("any")
url="https://github.com/joehillen/paruz"
license=("UNLICENSE")
depends=("bash" "fzf")
optdepends=("paru: for AUR support")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ea0eacf19d3d8aa908d5ac5dbd53081a26728ff13062b36f08848b1d2c471a29')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/paruz" "$pkgdir/usr/bin/paruz"
}
