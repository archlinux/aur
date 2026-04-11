# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.302.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.302.0/rblog-v0.302.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("80f6239b20d26c1ce5978ddd7722ddbdc80ce4070dc5d8decef2a8f495ea25fa")

package() {
    install -Dm755 "rblog-v0.302.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
