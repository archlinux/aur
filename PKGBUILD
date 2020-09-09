# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.0.1
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("fbe4aa723ba59661532ea3cb59544ddbdc08b7ae947201ee143d6104f83f3e57")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
