# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.123.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.123.0/rblog-v0.123.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("2d493b3b41adfceb1e3003a6ea25fd603e962760b014373a2b01c247f5fa2192")

package() {
    install -Dm755 "rblog-v0.123.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
