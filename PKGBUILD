# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.2
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("f388f9b335da777197742a6e59453f04cc5f6ae8e69beb113aaae178e1c9624d")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
