# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.10.3
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('7d124b51c29ea67c2253f44f31ee0fdf0a2cd68f81b168f20f273b330c09a7bd62d892eef5f0f093beb771d159cab47aab5ae7d0e8d3cc8e85855c8b93cd27d3')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
