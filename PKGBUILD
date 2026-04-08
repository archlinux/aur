# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=leanctl-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal-native AI coding agent with built-in LeanCTX token compression. Bring your own API key. (pre-built binary)"
arch=('x86_64')
url="https://leanctl.com"
license=('custom:proprietary')
depends=('gcc-libs')
provides=('leanctl')
conflicts=('leanctl')
source=("leanctl-$pkgver.tar.gz::https://github.com/yvgude/lean-ctl/releases/download/v$pkgver/leanctl-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('36b86a7f9305c5f29e4c023f19a5887005c3d41b0a9a4c1b6aff3abea780a70d')

package() {
  install -Dm755 "leanctl" "$pkgdir/usr/bin/leanctl"
}
