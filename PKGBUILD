# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.260.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.260.0/rblog-v0.260.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("6c31cb11618a30f14825cc844efacea68e093515f8d59d9470826ad6e5535e28")

package() {
    install -Dm755 "rblog-v0.260.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
