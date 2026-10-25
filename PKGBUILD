# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.304.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.304.0/rblog-v0.304.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("4ce1a563b5b63b20705feebe39cb852b31922957c0147c7986466d29d2e196cd")

package() {
    install -Dm755 "rblog-v0.304.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
