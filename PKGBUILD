# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.253.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.253.0/rblog-v0.253.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("40e9ecc30d810fe97176125d95af8ef01fb385160fbf83f52560ce98b183b514")

package() {
    install -Dm755 "rblog-v0.253.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
