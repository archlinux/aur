# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=no-cli
pkgver=1.0
pkgrel=1
pkgdesc="Print 'n' repeatedly"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/no"
license=('MIT')

source=("$url/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    gcc no.c -o no
}

package() {
    install -Dm755 no "$pkgdir/usr/bin/no"
}
