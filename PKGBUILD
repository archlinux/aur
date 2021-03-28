# Maintainer: Marcel H Rød <marcelroed@gmail.com>
pkgname=kattis
pkgver=1.2.5
pkgrel=1
pkgdesc="Competitive programming checker for open.kattis.com"
url="https://github.com/marcelroed/"
license=("MIT")
arch=("x86_64")
provides=("kattis")
options=("strip")
source=("https://github.com/marcelroed/kattis-rs/releases/download/v$pkgver/kattis-rs-$pkgver-x86_64.tar.gz")
sha256sums=("de4bb81ab593a32c1265a897c38a5f20f71a4ddab73ee4a3edd5fe3d92e81cf9")

package() {
    install -Dm755 kattis-rs -T "$pkgdir/usr/bin/kattis"
}
