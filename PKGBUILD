# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.4
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("aeb0f988f7cf3aac78192f2879c279b2e698be5be3f9171e9aff3c70b7d370af")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
