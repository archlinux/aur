# Maintainer: b1ek <me@blek.codes>
pkgname=hey-duck
pkgver=0.1.2
pkgrel=1
pkgdesc='Contact DuckDuckGo AI chat from your terminal'
url="https://git.blek.codes/blek/hey"
makedepends=('cargo' 'rust')
arch=('any')

source=('https://git.blek.codes/blek/hey/archive/0.1.2.tar.gz')
sha256sums=('a022a9e2186e75d4a768eefb4b098ce9fbfb2d11df27c77b399d058e031e703b')

build() {
    cd "$srcdir/hey"
    cargo b -r
}

package() {
    cd "$srcdir/hey/target/release"

    install -Dm755 hey "$pkgdir/usr/bin/hey"
    install -Dm755 hey "$pkgdir/usr/bin/hey,"
}
