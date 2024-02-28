# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.267.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.267.0/rblog-v0.267.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("da5e7a71b3a419fb332de9c5a0a2d3215cca47ba7ae6657ea9ca7e4310ba88ee")

package() {
    install -Dm755 "rblog-v0.267.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
