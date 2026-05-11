# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.5.18
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns, persistent knowledge, multi-agent orchestration. Privacy-first, opt-in only. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('281bb5487a22d8acd3ee30dcf734ec2e2f6f12c990174fc992a7ba721c25fa58')
sha256sums_aarch64=('87b5ffb5bb22583b44b80112bde474ddff24badd13bd7f82f4b073e2d00447e0')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
