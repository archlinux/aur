# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.32.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-$arch-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(92d7dd4eb00aa7538d323c8d2bf8526b676c13b2cd8bd06a539affac6b92f7eb)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(cc071e8cbcf0eccbc34c69555891688361caec512d5c1e1aa6602c4798c7362c)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
