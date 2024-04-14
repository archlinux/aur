# Maintainer: b1ek <me@blek.codes>
pkgname=hey-duck
pkgver=0.1.0
pkgrel=1
pkgdesc='Contact DuckDuckGo AI chat from your terminal'
url="https://git.blek.codes/blek/hey"
makedepends=('cargo' 'rust')
arch=('any')

source=('https://git.blek.codes/blek/hey/archive/0.1.0.tar.gz')
sha256sums=('c5268d0db86b73975665f3b5838505e3c83b7fde98cda321eae3f8ca1395c62f')

build() {
    cd "$srcdir/hey"
    cargo b -r
}

package() {
    cd "$srcdir/hey/target/release"

    install -Dm755 hey "$pkgdir/usr/bin/hey"
    install -Dm755 hey "$pkgdir/usr/bin/hey,"
}
