# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog
pkgver=0.118.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.118.0/rblog-v0.118.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("de3ff6725139195f5a3416225a0a81d200ccaf70e98f75fb516f62a21423ad41")

package() {
    install -Dm755 "rblog-v0.118.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
