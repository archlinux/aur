# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.29.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(147844270e1b6f22bd130ff3789491ed2131e95aec8b1bc19d8402bfd132b572)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(26006e0267cf1bf1e42e4e06c3a59016200ffa200e1ce5ddecc2b3da82402a59)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
