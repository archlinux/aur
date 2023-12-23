# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.265.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.265.0/rblog-v0.265.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("36415e5aba696be8ca2b1b5be322e51da0424fb51740cf2617672e35fd0bad1c")

package() {
    install -Dm755 "rblog-v0.265.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
