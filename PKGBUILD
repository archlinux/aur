# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.0.3
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("2deafdc8e13796169fe8d36ee53ca06285546ac855543d1e620f2b4a502f47e7")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
