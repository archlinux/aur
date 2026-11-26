# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tidy
pkgname=tidyrs-bin
pkgver=2.1.0
pkgrel=1
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
sha256sums_x86_64=('cba1c797d840b5dd9488f038759fe973a6afbb671129e99914ce3636b3b7cd4a')
sha256sums_aarch64=('2a4ec9db537b41422e6d74e74181a71916594f46c2bc1f66ad40681359971cbc')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-musl.tar.gz")

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/tidyrs"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
