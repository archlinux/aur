# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.32.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(61438e6f7e1b6c33dca1b4b441c11c3efad29432b59f242c15a52a5506d1774361438e6f7e1b6c33dca1b4b441c11c3efad29432b59f242c15a52a5506d17743)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(f289885f59e5f8d9ba55e0c760244cdea52d55428be89698dd8078f2d15e4c97)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
