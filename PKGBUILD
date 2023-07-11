# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.257.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.257.0/rblog-v0.257.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("2c9a955c621e11e05d5a2afadce9e576a2df7b92fa60b994b7f5ec141c048df3")

package() {
    install -Dm755 "rblog-v0.257.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
