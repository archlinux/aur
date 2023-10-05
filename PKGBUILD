# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
optdepends=('xdg-utils: register nzblink handler')
source=("https://github.com/Tensai75/nzb-monkey-go/releases/download/v$pkgver/nzb-monkey-go_v${pkgver}-linux-amd64.zip")
sha256sums=('aeab68df944bd74bcf431d395b7f55e0d6b643c422c6cb8a4a88f49ef7972852')
install=nzb-monkey-go.install
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git")

package() {
  cd "$srcdir"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
