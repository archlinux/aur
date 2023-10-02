# Maintainer: tuxxx <nzb_tuxxx@proton.me>
pkgname=nzb-monkey-go-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
optdepends=('xdg-utils: register nzblink handler')
source=("https://github.com/Tensai75/nzb-monkey-go/releases/download/v$pkgver/nzb-monkey-go_v${pkgver}-linux-amd64.zip")
sha256sums=('f2a4b13b7b1f1a235224807c989e1d18484b83a0b1dbb352c7c87454a9c77bdf')
install=nzb-monkey-go.install
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git")

package() {
  cd "$srcdir"
  install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
}
