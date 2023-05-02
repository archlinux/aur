# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.33.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(dfe4f29aff4c885dd6196d7623f50c8aad9c1627be8bc9abe67e424aeb78f63e)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(0239e01e4d63b11676351315bbe32fa4a2fbfb094cb9ef1d1e1d3e7e7c62285c)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
