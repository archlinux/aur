# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.1
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("99e4fd535e1cc392fb9de0e114471058737d09f188a310c21c3a0efcc5be7de0")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
