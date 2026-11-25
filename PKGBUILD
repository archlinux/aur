# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tidy
pkgname=tidyrs-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Fast, Prettier-style code formatter written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/lukeed/$_pkgname"
license=('MIT')
depends=()
provides=("tidyrs=$pkgver")
conflicts=('tidyrs')
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/lukeed/$_pkgname/v$pkgver/license")
sha256sums=('ba573393f24555ac0528612ad39665fab5bdcc80330a61096024bbf5f736526d')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('4b8166b1cdde610fd783f2d59511b0fb35d15ef96069ef20642b948ab90907ea')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('3428f45a00a7a60d11213a4b5c85ca5d4fbb7f982c84925161a375b45e9bc114')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/tidyrs"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
