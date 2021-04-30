pkgname=hxd
pkgver=0.1.0
pkgrel=1
pkgdesc='A better hexdump'
arch=('x86_64')
url="https://github.com/lptstr/hxd"
makedepends=()
source=("$url/releases/download/$pkgver/hxd-Linux-x86_64-$pkgver.tar.xz")
sha256sums=('086b5ffd0be4dc6ac96059bc9045cd58a70ac8e392af5aae96558d3c26743ce5')

package() {
  cd "hxd-Linux-x86_64-${pkgver}"
  install -Dm755 hxd "${pkgdir}/usr/bin/kxd"
}
