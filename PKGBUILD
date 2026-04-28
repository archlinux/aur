# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.2
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/swstl/mal-cli"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
sha256sums_x86_64=('6a8e4ca6e91ef0631cc216efe791c8f3916469eeabb794bb19f020a921b38e81')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
