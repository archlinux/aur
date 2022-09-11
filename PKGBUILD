# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=deno-bin
pkgver=1.25.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(deno-${arch}-unknown-linux-gnu.zip::https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(2985d16b522c37e88d6e3c831e5cca53b87228d1b715c31320ba61ebdeb36590)
source_aarch64=(deno-linux-arm64.zip::https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(a123fd0dc27c9e2f0813a523f7c447e4004aaf0398592a91369f7b50b5ef3e7d)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
