# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=broot-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Balanced tree view + fuzzy search + BFS + customizable launcher"
arch=(x86_64)
url="https://github.com/Canop/broot"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/Canop/broot/releases/download/v$pkgver/broot")
sha256sums=('ce01b5482e8bbed9148677f95dc572ef66b908c3c0b6dd2d10ab98b9ea9f2355')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/broot"
}
