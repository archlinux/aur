# Maintainer: Namaku1801 <namaku1801@gmail.com>
pkgname=deno-bin
pkgver=1.28.3
pkgrel=1
pkgdesc="A modern runtime for JavaScript and TypeScript."
arch=('x86_64' 'aarch64')
url="https://deno.land"
license=(MIT)
provides=(deno)
conflicts=(deno deno-git)
source_x86_64=(https://github.com/denoland/deno/releases/download/v$pkgver/deno-$arch-unknown-linux-gnu.zip)
sha256sums_x86_64=(1c9862ce87faca7793a1b336e0c207f5b0404e77cd47ba7e7d711dc4ff3b3ea1)
source_aarch64=(https://github.com/LukeChannings/deno-arm64/releases/download/v$pkgver/deno-linux-arm64.zip)
sha256sums_aarch64=(d6029baf22a78f7be82bbe0e22f86e34b2c23c6f038f101f9e0270deb9b239c8)

package() {
  install -Dm755 "$srcdir/deno" "$pkgdir/usr/bin/deno"
}
