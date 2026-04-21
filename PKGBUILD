# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, 90+ shell patterns, RRF-based token optimization, persistent knowledge, multi-agent orchestration. Reduces AI costs by 60-99%. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('490811d16e751e817c1f4013b3489b7098aa445299a7dd98f77ef10dd07238be')
sha256sums_aarch64=('de2daf5d39bf0dd9cf003f0605e58a8d5c63569f405d5c2ddaea94eff217e190')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
