# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.252.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.252.0/rblog-v0.252.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("12a6bf8c7a43496e660b33f80db95b3d94ae267f8ee55d0f2d790da0d5a31dc0")

package() {
    install -Dm755 "rblog-v0.252.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
