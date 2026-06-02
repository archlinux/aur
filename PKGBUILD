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
sha256sums_x86_64=('9cc0626c18614b0d2ce967e440f8bcd44bea2cb63179524119c09511765f74ca')
sha256sums_aarch64=('e536440dda565ff161316168358ddf668715f87e696153f939691dfdeed413bc')
sha256sums_armv7h=('1cf9c622c7f013f095206964e139e3e9563aa771eca6a8dac7912babeb80c00d')
sha256sums_i686=('83a557905bba70b2486f4d640b5667b65da31d84cce7dec613d2b8adac6ee51d')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
