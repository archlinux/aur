# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=0.2.0
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
optdepends=(gcc python)
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("2c4a1d0d11c0a2668044c3036179922b383308a56b881e682a4a092bd5d122ac")

package() {
    install -Dm755 kattis-rs -t "$pkgdir/usr/bin/kattis"
}
