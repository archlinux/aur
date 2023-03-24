# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.32.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(18c1f141f8f8eefb18a8f124c847d7e7e1433815ee0dbf2fcf20e96a7e9b5b21)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(d2558f73576961c2fb7c6b286834770b8f7ab0ec4bbef6e19a7c0b2523fa9a8e)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
