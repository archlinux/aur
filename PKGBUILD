# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.4
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/swstl/mal-tui"
license=('MIT')
depends=('glibc', 'mpv', 'ani-cli')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-aarch64")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-armv7")
source_i686=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-i686")
sha256sums_x86_64=('7da96b1185f256a3bed7745cce3bc37536144397a56ef3a0f638bb29ca7fa7eb')
sha256sums_aarch64=('d1b0513da86dfa4898cb17da96292a3864d8a45a9ea880022ba9ed939d9ec415')
sha256sums_armv7h=('9165f414994d79d0725c64685b39c2da82a558301a44872a92dc2deab7261a44')
sha256sums_i686=('ca828669186e22f25cb912cc18df532fef66a99dd4c89d3ff9464d4a40cc870a')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
