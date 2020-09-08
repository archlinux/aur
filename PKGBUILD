# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
_pkgname=deno
pkgrel=2
pkgver=1.3.3
provides=('deno')
sha256sums_x86_64=('6e2caa40f95d2372e08c75c37fb1b92a9b710a72e9eb95ce47b34965aa453ff0')
source_x86_64=("deno_x86_64.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='http://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
