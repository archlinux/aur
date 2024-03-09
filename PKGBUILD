# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
optdepends=('xdg-utils: register nzblink handler')
source=("https://github.com/Tensai75/nzb-monkey-go/releases/download/v$pkgver/nzb-monkey-go_v${pkgver}-linux-amd64.zip")
sha256sums=('59762a20e49ed9b10f80460bf941c2360b35bf5d1e090c3a906a4cc9c5915ddc')
install=nzb-monkey-go.install
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git")

package() {
  cd "$srcdir"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
