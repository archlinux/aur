# Maintainer: b1ek <me@blek.codes>
pkgname=hey-duck
pkgver=0.1.1
pkgrel=1
pkgdesc='Contact DuckDuckGo AI chat from your terminal'
url="https://git.blek.codes/blek/hey"
makedepends=('cargo' 'rust')
arch=('any')

source=('https://git.blek.codes/blek/hey/archive/0.1.1.tar.gz')
sha256sums=('bcb07104aa3468c3d7c584fcfff026f4d7b8b52e40b03e977651862ff3555d79')

build() {
    cd "$srcdir/hey"
    cargo b -r
}

package() {
    cd "$srcdir/hey/target/release"

    install -Dm755 hey "$pkgdir/usr/bin/hey"
    install -Dm755 hey "$pkgdir/usr/bin/hey,"
}
