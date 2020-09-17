# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.3
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("93f2dd3fdb3b53b00f4c4c48bedae74992026ac5e8bc986ae257fa964aff9baf")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
