# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=2.21.7
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 28 tools, 90+ shell patterns, temporal AI memory, multi-agent diaries, semantic caching, tree-sitter AST. Reduces AI costs by 60-99%. (pre-built binary)"
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source=("lean-ctx-$pkgver.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/yvgude/lean-ctx/v$pkgver/LICENSE")
sha256sums=('60282a176168401fa72c594d0d2aa9dcebaa36899b21e0b90ff85877a74cfafe'
            'SKIP')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
