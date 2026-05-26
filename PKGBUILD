# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.303.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.303.0/rblog-v0.303.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("2335a747bfc609858e8fc88440d39f2f9be3c7a9c2c65c77084df792ed16a13b")

package() {
    install -Dm755 "rblog-v0.303.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
