# Maintainer: Dogfetus <dogfetus@hotmail.com>
pkgname=mal-tui
pkgver=1.0.2
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/swstl/mal-cli"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
sha256sums_x86_64=('b4c25678cff8cc0b16a4e7092f6b85f36dae8da773ddb888875e73cba78e670d')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
