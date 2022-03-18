# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=deno-bin
pkgver=1.20.1
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=(x86_64)
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums=(acaf3ecb91560991a117d8ba8b2d93fc03ac2ae879fb2b6673a7c3da185b493c)

package() {
  install -Dm755 ./deno "$pkgdir"/usr/bin/deno
}
