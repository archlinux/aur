# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.31.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(9b5960c6619e07e62f118881608f2cfd37119c053e93e334f40e065fc5dbfb90)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(c6634eefc5a16bf656ca9fb55f21b36ed9c6ba7b6d64eb9bb92d167e72e6c8a3)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
