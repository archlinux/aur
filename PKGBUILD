# Maintainer: Omibranch <pprrottonn@gmail.com>
pkgname=qgraph
pkgver=0.1.0
pkgrel=1
pkgdesc="Visual knowledge graph over qnote — Tauri 2 + React 18 desktop app"
arch=('x86_64')
url="https://github.com/Omibranch/qgraph"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'librsvg')
source=("$pkgname-$pkgver-linux_x86_64.tar.gz::https://github.com/Omibranch/qgraph/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('1aa5ff0bf296177a54ea4f69c181a4ab7e1fbbe3bb3468d331e490b5cb58898d')

package() {
  install -Dm755 "$srcdir/qgraph_release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/qgraph_release/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/qgraph_release/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
