# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.7.4
provides=('deno')
sha256sums_x86_64=('bfb078cd785891093d174a74190027ac0f51ab09bad3ee208f7d713c8b73c0b3')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
