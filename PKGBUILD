# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.10.4
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('16576c58f5038c4dc05cec038ed30bc199e7d93e6d62003516058da9dad279e2e17f56ec6e0ea6072a71ff0ad70f988cc7703f60a2103b2778f8fda0d9a7f515')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
