# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.28.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(6ae9a52f617e1d0f47c56cd6fef4462e9beb8b6a85070473ee428ef2720eb8f5)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(72ebf2f500c8f15f2028df5c71ccdbb66e63750f3a3c1054e3d48376a3168064)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
