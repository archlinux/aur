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
sha256sums_x86_64=(647665c9b46b88d5f987557574c6de240d8bd93bb9eafe9b8312731725bf5c81)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(be23c2d62845a17d5833e3aa717bc6e55019b794f24bed2f62928725d012db55)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
