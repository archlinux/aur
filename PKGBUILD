# Maintainer: Batou <batou@cryptolab.net>

pkgname=dezoomify-rs-bin
pkgver=2.15.0
pkgrel=1
pkgdesc="Download zoomable images from online viewers (Rust implementation)"
arch=('x86_64')
url="https://github.com/lovasoa/dezoomify-rs"
license=('MIT')
depends=()
provides=('dezoomify-rs')
conflicts=('dezoomify-rs')
source=("https://github.com/lovasoa/dezoomify-rs/releases/download/v${pkgver}/dezoomify-rs-linux.tgz")
sha256sums=('21f461b0ad475e3dce5ae027fe986081bf60ce6b49abf25892364bcf84d55de3')

package() {
  install -Dm755 dezoomify-rs "$pkgdir/usr/bin/dezoomify-rs"
}
