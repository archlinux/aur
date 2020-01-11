# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=broot-bin
pkgver=0.11.7
pkgrel=1
pkgdesc="Balanced tree view + fuzzy search + BFS + customizable launcher"
arch=(x86_64)
url="https://github.com/Canop/broot"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/Canop/broot/releases/download/v$pkgver/broot")
sha256sums=('bf7afc9acbd8609d485faa2c39b61f8a984e786a634b4a37ec2d2a40aaf503d1')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/broot"
}
