# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.259.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.259.0/rblog-v0.259.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("ed6a66923e39061482a3e35893cdc7c7a3ec453bba364c6535883920f5a2a519")

package() {
    install -Dm755 "rblog-v0.259.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
