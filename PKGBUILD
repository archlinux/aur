# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=deno-bin
pkgver=1.19.2
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=(x86_64)
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums=(6864d019f0ced1657843fde73022bd53b13dc2e14923393a6ec9cde2097ca867)

package() {
  install -Dm755 ./deno "$pkgdir"/usr/bin/deno
}
