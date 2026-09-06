# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.10.1
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — MCP tools, 10 read modes, 95+ shell patterns, persistent knowledge, multi-agent orchestration. Privacy-first, opt-in only. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
# onnxruntime: semantic search loads libonnxruntime.so at runtime (ort's
# `load-dynamic`); the pre-built binary resolves it from /usr/lib.
depends=('gcc-libs' 'onnxruntime')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dae5bde18c58b7976b98f967f261bbdece8d3072dda23e6509f3da7d581b5c58')
sha256sums_aarch64=('7bb3c5f306276d4dc8e769de0aa771827c030077ac892980ab6c50129809a9b5')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}


