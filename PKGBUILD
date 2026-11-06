# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.305.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.305.0/rblog-v0.305.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("9578a808986c30c7992c5f0bbcbc7defa03a852248e9c98b17c9b37b496e5fa0")

package() {
    install -Dm755 "rblog-v0.305.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
