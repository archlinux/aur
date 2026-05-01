# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.4.7
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 46 MCP tools, 10 read modes, 90+ shell patterns, persistent knowledge, multi-agent orchestration. Privacy-first, opt-in only. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ec405e643a4c4cb3e7fdd2818801f11a6d0209cbcfe0ce085df1d62335a5053b')
sha256sums_aarch64=('72435a42bb33afc3d3cd5a62426955c6488192826a3a84d57e26f587740534d9')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
