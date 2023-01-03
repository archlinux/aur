# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.29.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(8c2d0bb132d481f8c9c64efbaab7380c4a129420b37e11c399724b9f054fe49e)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(44a24471fdbf5cb96dd806dfbcc49db51748c0ef7ed3ea253868405a98fb4634)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
