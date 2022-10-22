# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.204.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.204.0/rblog-v0.204.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("cf3809760af9e232cdd7d999a64c3bb17f03a08b9931d9bc3b32887c8373f7ac")

package() {
    install -Dm755 "rblog-v0.204.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
