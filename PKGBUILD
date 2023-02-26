# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.31.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(40b9d50630f9668a7a72d01d68b61723cc659194c13e9555641ac2ab6273bc0f)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(275440cd8c6c4c03eb5b671659d4bb6c777fb356bd0bcc8b66eaa16b6c0ea93d)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
