# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=deno-bin
pkgver=1.19.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=(x86_64)
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums=(fc70e7e7730d3fcdadf3ab0dfe1aa1ed0da587e5ef78cd5e060f98b3393cd883)

package() {
  install -Dm755 ./deno "$pkgdir"/usr/bin/deno
}
