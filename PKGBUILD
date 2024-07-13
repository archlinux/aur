# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
optdepends=('xdg-utils: register nzblink handler')
source=("https://github.com/Tensai75/nzb-monkey-go/releases/download/v$pkgver/nzb-monkey-go_v${pkgver}-linux-amd64.zip")
sha256sums=('7a5071ab9d1f2cc7086655f003cc3d226a063c6983771c8b9e48e8ce39d3a929')
install=nzb-monkey-go.install
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git")

package() {
  cd "$srcdir"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
