# Maintainer: Manoj Karthick Selva Kumar
pkgname=reddsaver-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI tool to download saved media from Reddit"
url="https://github.com/manojkarthick/reddsaver"
license=("MIT/Apache-2.0")
arch=("x86_64")
provides=("reddsaver")
options=("strip")
source=("https://github.com/manojkarthick/reddsaver/releases/download/v$pkgver/reddsaver-$pkgver-x86_64.tar.gz")
sha256sums=("57dd92a501057477506fb6b360b1fb01b9e5a85a461d5633c154ad839fb80f62")

package() {
    install -Dm755 reddsaver -t "$pkgdir/usr/bin/"
}
