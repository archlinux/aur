# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=0.3.0
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("6edc10374487a978de7dc747f97d8d1b80daaaaa6baf73c076aedd8246fc6596")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
