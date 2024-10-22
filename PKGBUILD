# Maintainer: b1ek <me@blek.codes>
pkgname=hey-duck
pkgver=0.2.0
pkgrel=1
pkgdesc='Contact DuckDuckGo AI chat from your terminal'
url="https://git.blek.codes/blek/hey"
makedepends=('cargo' 'rust')
arch=('any')

source=('https://git.blek.codes/blek/hey/archive/0.2.0.tar.gz')
sha256sums=('949a20c534241c21cd0b02d81e20946d42c9c92165abf75944faecd918c4124c')

build() {
    cd "$srcdir/hey"
    cargo b -r
}

package() {
    cd "$srcdir/hey/target/release"

    install -Dm755 hey "$pkgdir/usr/bin/hey"
    install -Dm755 hey "$pkgdir/usr/bin/hey,"
}
