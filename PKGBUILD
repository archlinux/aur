# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.0.3
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=()
makedepends=('gcc')
source=("shuffle-1.0.3.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('3e4193edfe1feea9d47d0fd895119aff73267f412d2a280aad17f96ca576dd21')

build() {
    cd "$srcdir/shuffle-1.0.3"
    make
}

package() {
    cd "$srcdir/shuffle-1.0.3"
    sudo make DESTDIR="$pkgdir" install
}
