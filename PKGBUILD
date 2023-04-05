# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-arm
pkgver=1.32.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(cc071e8cbcf0eccbc34c69555891688361caec512d5c1e1aa6602c4798c7362c)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
