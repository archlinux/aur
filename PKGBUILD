# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.261.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.261.0/rblog-v0.261.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("2afc7c418dc396b8d1be5ec514de18cf8f844bfd7799c3297e85b1e26c336419")

package() {
    install -Dm755 "rblog-v0.261.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
