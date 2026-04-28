# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.3
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/swstl/mal-cli"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
sha256sums_x86_64=('8f930c2a81eb18aacad59f3152a1fa47ca26fc7393020b77a710492eccc8ed69')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
