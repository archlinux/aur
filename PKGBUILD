# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
optdepends=('xdg-utils: register nzblink handler')
source=("https://github.com/Tensai75/nzb-monkey-go/releases/download/v$pkgver/nzb-monkey-go_v${pkgver}-amd64-linux.zip")
sha256sums=('44a4a212324cad0a560d235702d952a8d6d739e03f5aeaf15322d62e2c418f35')
install=nzb-monkey-go.install
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git")

package() {
  cd "$srcdir"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
