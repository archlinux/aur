# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.205.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.205.0/rblog-v0.205.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("cf502aae3258910397883cc87c4b4bb03921d69ceecb161b61471829b931190f")

package() {
    install -Dm755 "rblog-v0.205.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
