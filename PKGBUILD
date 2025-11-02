# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.280.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.280.0/rblog-v0.280.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("c946abc56d52d52d9f7032d70d80da5d51f213415945afa8ea7e37b06c99fd50")

package() {
    install -Dm755 "rblog-v0.280.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
