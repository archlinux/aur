# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=2
pkgver=1.4.6
provides=('deno')
sha256sums_x86_64=('db69a4548cc31c093b96ed9c69a6a5b136285e84be315cbe95d8a3ad1caeea09')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
