# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.258.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.258.0/rblog-v0.258.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("a9c6eceb57a044cee459f7deb6de863aece4ad4ee52da5a26b663edae2211991")

package() {
    install -Dm755 "rblog-v0.258.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
