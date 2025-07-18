# Maintainer: Daniel Komitski <iceeburr@gmail.com>

pkgname=argon-rbx
pkgver=2.0.25
pkgrel=1
pkgdesc="Full featured tool for Roblox development "
arch=('x86_64')
url="https://github.com/argon-rbx/argon"
license=('Apache-2.0')
source=("argon-$pkgver.zip::https://github.com/argon-rbx/argon/releases/download/$pkgver/argon-$pkgver-linux-$CARCH.zip")
sha256sums=('e5b2964508214a17dfb029e4118502d5a531bce7abcc86f7961cc70689ce841f')

package() {
  install -Dm755 "$srcdir/argon" "$pkgdir/usr/bin/argon"
}
