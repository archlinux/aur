# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/swstl/mal-cli"
license=('GPL-3.0-only')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
sha256sums_x86_64=('c1b6936711f7a1ef6e1fd77961fd56383430b2ef2d0a60ad4b59f2e07861c5d1')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
