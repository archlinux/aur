# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.269.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.269.0/rblog-v0.269.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("f45220ad66cc49750467357e5e941740c04ac782f6a17baa9486a47178094523")

package() {
    install -Dm755 "rblog-v0.269.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
