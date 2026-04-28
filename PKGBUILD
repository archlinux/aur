# Maintainer: Dogfetus <dogfetus@hotmail.com>
pkgname=mal-tui
pkgver=1.0.5
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/swstl/mal-cli"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
sha256sums_x86_64=('5e4026990c4cf1f9216fabd2f6914c1d962a18642c6dfdf8242e6d51ba7cd360')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
