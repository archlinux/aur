# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.122.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.122.0/rblog-v0.122.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("c94e01e5e1dcb75706f769c3f2a12ae2a3fcab378e526691785d54c5e6b9c66e")

package() {
    install -Dm755 "rblog-v0.122.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
