# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="A secure JavaScript and TypeScript runtime."
pkgname=deno-bin
pkgrel=1
pkgver=1.4.0
provides=('deno')
sha256sums_x86_64=('bb53b392fd79bf58d6e99ef8abc3852bd19ecb5732a20b82d00f0bcf8f2b2b60')
source_x86_64=("deno_x86_64.zip::https://github.com/denoland/deno/releases/download/v${pkgver}/deno-x86_64-unknown-linux-gnu.zip")
url='https://deno.land/'

package() {
  install -D -m755 deno "$pkgdir/usr/bin/deno"
}
