# Maintainer: hongnoul
pkgname=gwae-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="niri's scrolling tiling for your CLI agents, in any terminal (daemon-free multiplexer)"
arch=('x86_64' 'aarch64')
url="https://github.com/hongnoul/gwae"
license=('MIT')
provides=('gwae')
conflicts=('gwae')
source_x86_64=("gwae-$pkgver-x86_64.tar.gz::https://github.com/hongnoul/gwae/releases/download/v$pkgver/gwae-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("gwae-$pkgver-aarch64.tar.gz::https://github.com/hongnoul/gwae/releases/download/v$pkgver/gwae-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('039775ed62a4ebb404bd76ce24f23abe0966df66fe2a5efc2672458eb4da8429')
sha256sums_aarch64=('0a36dc4c2a82951a42a3de633880ef4f980ac56c514e3e2aa5130a5d35adb4dc')

package() {
  install -Dm755 gwae "$pkgdir/usr/bin/gwae"
}
