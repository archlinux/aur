# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=latestspigot
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple Go program that downloads and builds the latest spigot"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source_i686+=($pkgname::$url/releases/download/$pkgver/linux_386)
source_x86_64+=($pkgname::$url/releases/download/$pkgver/linux_amd64)
sha256sums_i686=('83e8bd9225bdf92cfe7aa742ef5f93c85c0822b85257f3f9f3b08e54998628a2')
sha256sums_x86_64=('b6db88e872950c5b3f6ff6e5dcf55f2a3d78ae2e1c15d79b236fd4e3e2cca798')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
