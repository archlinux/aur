# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=objstor
pkgver=0.4.20
pkgrel=1
pkgdesc="One stop for storing all your data."
url="https://github.com/prabirshrestha/objstor"
license=("MIT")
arch=("x86_64")
provides=("objstor")
source=("https://github.com/prabirshrestha/objstor/releases/download/v0.4.20/objstor-v0.4.20-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("3ad390264cbf298fc8c2ded03d69e8a7c7eeea8d61f50af6651d31f08216f276")

package() {
    install -Dm755 "objstor-v0.4.20-x86_64-unknown-linux-musl/objstor" "$pkgdir/usr/bin/objstor"
}
