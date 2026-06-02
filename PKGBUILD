# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.7
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
sha256sums_x86_64=('7162a1a4de49dee925ee4cfc8f572a22faefabbfd7ea7e47ff07ee42600f94e7')
sha256sums_aarch64=('f31d56ec58d7b757f66c2a00d547582fb235b0ccd1c404a1c43c7b2103e9a9d1')
sha256sums_armv7h=('725cfa0004b5c7e589d7545bf0425822c45df6fdb335fdc979f888cf464a0787')
sha256sums_i686=('87bd01f6e978fecef8fbc4f18145f2a752554f89faa78f46f40aa43ffa1239fc')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
