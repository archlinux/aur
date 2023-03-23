# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(8eef9c7f911d8aa4d0776435080360ed2dde3c4ad5296506dee9096b5bd1d7cf)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(2be37a8eb61e8b54dbfadd666ef5386c1dfef118b5a9738980d4b01c21873ac9)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
