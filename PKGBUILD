# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=tidy
pkgname=tidyrs-bin
pkgver=2.1.1
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
sha256sums_x86_64=('28e092f900747aad34a97c78873d9394b169ae4387f61bea66609752b63d23c7')
sha256sums_aarch64=('29cf25e430be7c8707b8aa958690ccb47dba7513b55718e8d677def75e4ed18f')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-musl.tar.gz")

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/tidyrs"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
