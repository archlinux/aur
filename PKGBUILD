# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.274.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.274.0/rblog-v0.274.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("1a959ed66b3d42793f257dc3c4bb039741b65ca21551a907f7b5142665cc00e7")

package() {
    install -Dm755 "rblog-v0.274.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
