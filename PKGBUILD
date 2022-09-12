# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.200.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.200.0/rblog-v0.200.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("10691ae236a379254a86f080460eb83427ab735217f07d9bb5f8f33f522bd2b9")

package() {
    install -Dm755 "rblog-v0.200.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
