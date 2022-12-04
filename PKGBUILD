# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.250.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.250.0/rblog-v0.250.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("c17d814254f94e7caaaff19fa83e1b3bf0cc47374959c42b9fce3e77fedbe1b7")

package() {
    install -Dm755 "rblog-v0.250.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
