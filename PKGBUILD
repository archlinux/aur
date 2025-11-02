# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.279.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.279.0/rblog-v0.279.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("d5ee0c4feca26c549896c3a1fb61f984ac4c32bbca59260db348b7eedffdce7d")

package() {
    install -Dm755 "rblog-v0.279.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
