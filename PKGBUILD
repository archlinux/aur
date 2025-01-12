# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.271.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.271.0/rblog-v0.271.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("18302f70a3425e6422ebb23315bace365e45364129eb86a905a8b81d8b21f086")

package() {
    install -Dm755 "rblog-v0.271.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
