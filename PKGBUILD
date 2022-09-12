# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.201.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.201.0/rblog-v0.201.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("7b237e804e7da251edcb597558fc96d985ecc09d7aabcd50f1606dac0248061d")

package() {
    install -Dm755 "rblog-v0.201.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
