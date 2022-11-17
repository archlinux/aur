# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.28.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(cf54d2edd8bb2619dd10fa3b93d4f8e483ca8821ab3854c491770e555a6668cf)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(49ef0a3886f92cf343a0c1560097719eecfade4a61a68f401ec30482939da846)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
