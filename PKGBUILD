# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>

pkgname="fnlfmt-git"
pkgver=0.2.2
pkgrel=1
pkgdesc="Format your Fennel!"
arch=("any")
url="https://git.sr.ht/~technomancy/fnlfmt"
license=("GPL3")
depends=("lua")
makedepends=("lua" "make")
source=("git+https://git.sr.ht/~technomancy/fnlfmt")
sha256sums=('SKIP')

build() {
    cd fnlfmt
    make
}

package() {
    install -D -m755 "$srcdir/fnlfmt/fnlfmt" "$pkgdir/usr/bin/fnlfmt"
}
