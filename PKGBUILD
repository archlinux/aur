# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.270.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.270.0/rblog-v0.270.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("be25e0ff1c0c29d0e5e7bf9c6a352c192564205898f2df2dc8a98fb2efed3f68")

package() {
    install -Dm755 "rblog-v0.270.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
