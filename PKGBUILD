# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=broot-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Balanced tree view + fuzzy search + BFS + customizable launcher"
arch=(x86_64)
url="https://github.com/Canop/broot"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/Canop/broot/releases/download/v$pkgver/broot")
sha256sums=('6cf61d4a1b3df7813fdcf413fc3ce2ff99fea9181aca4e3705fc6383d4ada4fe')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/broot"
}
