# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.31.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(2ac928643a4b3c4cebd042d2e7b5c3be295a6ad8a6e9d427d36d32fab95de23f)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(87871c74b6b7d9b9008e7d840b8d70909737354376e720fe40db0337737d6519)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
