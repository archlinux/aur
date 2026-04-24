# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.3.7
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
sha256sums_x86_64=('0bd4e77cd9f8ee283dc97ac534fd5885f8cc7c4827683bbad652590ddb7279bd')
sha256sums_aarch64=('8a1263ffba3b7f53261e693e8f97d77b5f3ca522270264ea385257f2dc16e928')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
