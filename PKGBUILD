# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.0.0
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("2f6a82a7b4b9bc2a6eafba78e2ced798dd487d9edc991a01fe90997ecba70fae")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
