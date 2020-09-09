# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.0.2
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("fa0d7c456955343abdd65538c67a0405236d9e8e95de7d6971644096908b00c2")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
