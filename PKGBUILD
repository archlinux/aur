# Maintainer: augustus-7613 <augustus7613.mail@pm.me>
pkgname=httpcode
pkgver=1.0.1
pkgrel=1
pkgdesc="Tool to lookup HTTP codes"
arch=('x86_64')
url="https://github.com/augustus-7613/httpcode"
license=('GPL3')
makedepends=('glibc' 'gcc' 'make')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f39bafdc8cd3258208b1feb6ff8d13953addf767b95e985f9a9caaa143dcbd67')
options=('!debug')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 httpcode "$pkgdir/usr/bin/httpcode"
}
