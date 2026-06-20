# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.8.11
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 77 MCP tools, 10 read modes, 95+ shell patterns, persistent knowledge, multi-agent orchestration. Privacy-first, opt-in only. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fab37f84639b677deed6613c7c324e13c395adf4c28e6e0dc2ba27f58e5b417c')
sha256sums_aarch64=('add02ccdd07138fa11d33e71411b851480adb07051581b5e9456b3df98d98025')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
