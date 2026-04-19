# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.2.7
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
sha256sums_x86_64=('dffb819b3f6644dd8db99547683294cc7e9424f774388650a1a21f9041a899aa')
sha256sums_aarch64=('23502371002b4183c66d592908472e69c987dd25365a2699c98680e09d3ac55a')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
