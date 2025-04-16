# Maintainer: Prabir Shrestha <mail@prabir.me>
pkgname=rblog-bin
pkgver=0.278.0
pkgrel=1
pkgdesc="Blog app"
url="https://github.com/prabirshrestha/rblog"
license=("MIT")
arch=("x86_64")
provides=("rblog-bin")
conflicts=("rblog")
source=("https://github.com/prabirshrestha/rblog/releases/download/v0.278.0/rblog-v0.278.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("dfa32a94f352795bbaefc8578ba5027125339dac1e61ca1e46a8aeef1a518547")

package() {
    install -Dm755 "rblog-v0.278.0-x86_64-unknown-linux-musl/rblog" "$pkgdir/usr/bin/rblog"
}
