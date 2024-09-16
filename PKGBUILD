# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('dc3e5ab08fb1a42f1933fc84326a89804c901a35142d27b4b7751e46ae033237f996ac2f493b76ea8229103c398334371cd620b05c07db33886e84af206b8722')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
