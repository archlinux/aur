# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.121.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.121.0/rblog-v0.121.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("bbad2bc098158253718de923be30aa6247dc33f698859b61fce2dd96b554829f")

package() {
    install -Dm755 "rblog-v0.121.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
