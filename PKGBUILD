# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.4.0
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
sha256sums_x86_64=('0ee85b4e090b5b212a3ca5a33c7c2e6e754fcd4d0827adf7eb904f33ea376a93')
sha256sums_aarch64=('bf0a8dbc50c88255373f32519048d9f87bceb2da7116a4bdf34f0f39917d282c')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
