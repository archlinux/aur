# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.27.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(1f23102a92abe8d65cb194ae14d1ef4a4ea8574e53061eecb8381fd8371bbefc)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(0b6ecc7271d09aaeec6f232590f860baf6d780ac6c5898aedfc97ff4eba6c40c)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
