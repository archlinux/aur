# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.8
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/swstl/mal-tui"
license=('MIT')
depends=('glibc' 'ani-cli')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-aarch64")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-armv7")
source_i686=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-i686")
sha256sums_x86_64=('063af789f5dbf78f6998a160ed84fa98eff95aad34e12c87d208c8229381dcc3')
sha256sums_aarch64=('5bdb5a2f4aeba4c6bd712c3cf4539f6d4cad8b5bfa168b27d440d91146c505a1')
sha256sums_armv7h=('15b50e4b9ed488b6183204eab2a5135976c59bbce9d869a39b9d5d7c654f8dad')
sha256sums_i686=('3280ebcfcbcbb85ccd692a8a8307bbf3fa978a51c4cbedbb6be075d9f1df65cf')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
