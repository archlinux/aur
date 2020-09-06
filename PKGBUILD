# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=0.2.3
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("ae617f9b600db033cf2900d1d9bea4bc799410ccbdff2dd8d09616bd6669360f")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
