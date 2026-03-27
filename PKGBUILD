# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Context Intelligence Engine with CEP + CCP — 21 MCP tools, 90+ shell patterns, Cognitive Efficiency Protocol, cross-session memory, LITM-aware positioning, tree-sitter AST (14 languages). Reduces LLM token consumption by up to 99%. (pre-built binary)"
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source=("lean-ctx-$pkgver.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/yvgude/lean-ctx/v$pkgver/LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
