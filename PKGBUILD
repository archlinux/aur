# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=0.2.4
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("063f85939d258170ee74bbf73e5762202346b630c5e3e35f1035a574577569c7")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
