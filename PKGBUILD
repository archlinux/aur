# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=leanctl-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Context-engineered AI coding CLI with thinking steering. Powered by lean-ctx. 40+ tools, multi-provider, hybrid search."
arch=('x86_64')
url="https://leanctl.com"
license=('custom:proprietary')
provides=('leanctl')
conflicts=('leanctl')
source=("leanctl-$pkgver.tar.gz::https://github.com/yvgude/lean-ctl/releases/download/v$pkgver/leanctl-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('60efed6a7a97fa82d22e9065a872748c09409885f9d23dbac16962ebe64d82c4')

package() {
  install -Dm755 "leanctl" "$pkgdir/usr/bin/leanctl"
}
