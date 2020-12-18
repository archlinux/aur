# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.6.1
provides=('deno')
sha256sums_x86_64=('00496e4b3486069475384fbb523dc5157c6ab22dee12e7496d45d4c172567d1b')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
