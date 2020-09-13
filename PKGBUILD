# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.0
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("8754aff9b91a70c090948bc8068f5163050fc3934cc4f03b35d7709d38f8efc0")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
