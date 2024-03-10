# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.268.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.268.0/rblog-v0.268.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("8dccb2cd010123cd271f759c09b3110157e675b0d8fd054061f79fca32c81bb7")

package() {
    install -Dm755 "rblog-v0.268.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
