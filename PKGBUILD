# Maintainer: Rakshith Ravi <rakshith.ravi@vicara.co>
pkgname=patrcli
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI app for interacting with patr resources"
url="https://patr.cloud"
license=("MIT")
arch=("x86_64")
provides=("patr")
conflicts=("patr")
source=("https://github.com/oliashish/aur-release/releases/download/0.2.1/patr-0.2.1.tar.xz")
sha256sums=("SKIP")

package() {
    install -Dm755 "$srcdir/patr" "$pkgdir/usr/bin/patrcli"
}