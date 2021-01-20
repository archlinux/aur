# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.7.0
provides=('deno')
sha256sums_x86_64=('7a5f8fbe2131e6ddcc294ed1abbb19c9fe7ab9449762573236f3d900885635cf')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
