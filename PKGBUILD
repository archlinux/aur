# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(0956e325144eecff768d06f3bccc1213327047ad5f186a416181697ffaa115a4)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(b5735bbdf52cec2184c2d3947f7d80e3336b5dbea7d7efbfac8f97d68bc1144b)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
