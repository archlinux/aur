# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.203.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.203.0/rblog-v0.203.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("58f59f96be735d3625ef4045c62a6418f441909f46b8e45f12d0f3afea084c92")

package() {
    install -Dm755 "rblog-v0.203.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
