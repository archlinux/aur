# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.5.3
provides=('deno')
sha256sums_x86_64=('2452296818a057db9bf307bd72c5da15883108415c1f7bd4f86153e3bce5cd44')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
