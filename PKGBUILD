# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.266.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.266.0/rblog-v0.266.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("3bbd17e1d19822bff7ea3cd14aca8c03a36a269ec591fcca966940ceae9ccf19")

package() {
    install -Dm755 "rblog-v0.266.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
