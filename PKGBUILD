# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=broot-bin
pkgver=0.11.6
pkgrel=1
pkgdesc="Balanced tree view + fuzzy search + BFS + customizable launcher"
arch=(x86_64)
url="https://github.com/Canop/broot"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/Canop/broot/releases/download/v$pkgver/broot")
sha256sums=('1728fbedc85d5d032a55c7abe00b3ff16c167a0d4c11d71d2b8e077a0d0a66ec')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/broot"
}
