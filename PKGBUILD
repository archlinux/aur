# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=latestspigot
pkgname="${_pkgname}-bin"
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple Go program that downloads and builds the latest spigot"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source+=($pkgname::$url/releases/download/$pkgver/LatestSpigot-linux)
sha256sums=('a45fc65c47b68f2d2909e7abd571b1442f1df6a8d855ce4ce11a7dc3db076827')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
