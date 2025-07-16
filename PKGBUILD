# Maintainer: Daniel Komitski <iceeburr@gmail.com>

pkgname=argon-rbx
pkgver=2.0.24
pkgrel=1
pkgdesc="Full featured tool for Roblox development "
arch=('x86_64')
url="https://github.com/argon-rbx/argon"
license=('Apache-2.0')
source=("argon-$pkgver.zip::https://github.com/argon-rbx/argon/releases/download/$pkgver/argon-$pkgver-linux-$CARCH.zip")
sha256sums=('5404bb9cbb67d87c123fd3050fb922b493de38368e0c389db2f5f24c97af12c6')

package() {
  install -Dm755 "$srcdir/argon" "$pkgdir/usr/bin/argon"
}
