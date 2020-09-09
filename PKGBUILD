# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.1.0
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("e7dbbffe50e5580ac955770f97e6f2a2b3bf262da367e69e711cef42f51adcf7")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
