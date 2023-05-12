# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.33.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(665eca1a9294e04a835cfa3337677376d7d6609a1b6d8e69b7b1cbfc243b531e)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(7d1e5b32928e6331b05610e4cfa7e894bd4944b4f7526e5e8c5ebaa7a666bfe3)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
