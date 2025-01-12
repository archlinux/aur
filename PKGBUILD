# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.273.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.273.0/rblog-v0.273.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("795923775e4e54a4a25a188c9d884420fc11a96f8dfc35dab8fa1b0ca5b6bb16")

package() {
    install -Dm755 "rblog-v0.273.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
