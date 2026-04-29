# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.3
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/swstl/mal-tui"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-aarch64")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-armv7")
source_i686=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-i686")
sha256sums_x86_64=('8f930c2a81eb18aacad59f3152a1fa47ca26fc7393020b77a710492eccc8ed69')
sha256sums_aarch64=('801b54cb2bd6b32b7b58fc2f3247c18ccd102b8d562944b244d19cba0f0ca521')
sha256sums_armv7h=('26d76ad65dae8e3f0502c76357353119107182fd6d98cb6e6687b21e00f95baf')
sha256sums_i686=('9d3e2152f5eebb29342fdca120b198675f9a07085d571337a5b0a5aa717604ec')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
