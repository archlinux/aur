# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=deno-bin
pkgver=1.25.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-${arch}-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(9a078665c17269d96486ee3c9f9bd16eb3fb4acf79946c88b1e4bab622d1258c)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(f09a1852e4bdf0b9fc4e4a1ca2424521056bf76f806dc9baa450037f48a95a01)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
