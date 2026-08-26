# Maintainer: hongnoul
pkgname=gwae-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="niri's scrolling tiling for your CLI agents, in any terminal (daemon-free multiplexer)"
arch=('x86_64' 'aarch64')
url="https://github.com/hongnoul/gwae"
license=('MIT')
provides=('gwae')
conflicts=('gwae')
source_x86_64=("gwae-$pkgver-x86_64.tar.gz::https://github.com/hongnoul/gwae/releases/download/v$pkgver/gwae-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("gwae-$pkgver-aarch64.tar.gz::https://github.com/hongnoul/gwae/releases/download/v$pkgver/gwae-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('c6fdbf4b7d1b8839043b52341fb2369aed228c8a15bed3dfd28e46dc9ce03fd5')
sha256sums_aarch64=('8b5a6d201c880ed76afddd6b92ed74e9a41cca315ff87d82b05d93d1f740b727')

package() {
  install -Dm755 gwae "$pkgdir/usr/bin/gwae"
}
