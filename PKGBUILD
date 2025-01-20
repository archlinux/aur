# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.276.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.276.0/rblog-v0.276.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("7762fdbfe4d1067fce97cb00fbdd9cab235ac33b4f2fba5518b01e3c87edad43")

package() {
    install -Dm755 "rblog-v0.276.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
