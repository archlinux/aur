# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=libfsyncblock
pkgver=1.0
pkgrel=1
pkgdesc="Lightweight reimplementation of libeatmydata"
arch=('x86_64')
url="https://gitlab.com/pbs3141/$pkgname"
license=('GPL3')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a1cc5462b6aa21efc3bb136d84352154c1d5bca6283b1c8a0a65500947f3cb0d')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm644 -t "$pkgdir/usr/lib/" libfsyncblock.so
}
