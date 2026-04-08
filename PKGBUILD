# Maintainer: NTMPO <alex.borodach2511@gmail.com>
pkgname=infofetch
pkgver=1.1
pkgrel=1
pkgdesc="infofetch is a simple neofetch-like system information tool written in C."
arch=('x86_64')
url="https://github.com/NTMPO/infofetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb50703a56935726c5a9b9a6f37e2e2db58ff131130f13da63ae69e7cc60890f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
