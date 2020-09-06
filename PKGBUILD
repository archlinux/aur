# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=0.2.2
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("cee8df163d421164d4c2b4462bd13fe59df1f658069ccd2a4ff4b623e0678c0c")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
