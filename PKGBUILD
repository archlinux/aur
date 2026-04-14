# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 36 intelligent tools, 8 read modes, 90+ shell patterns, neural token optimization, persistent knowledge, multi-agent orchestration. Reduces AI costs by 60-99%. (pre-built binary)"
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source=("lean-ctx-$pkgver.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/yvgude/lean-ctx/v$pkgver/LICENSE")
sha256sums=('43b853d7a6dd8a515a400c890cb8cdfbd71d05cd5027e419ab46d1e69f9954ee'
            'SKIP')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
