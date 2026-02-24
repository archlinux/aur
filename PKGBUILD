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
sha256sums=('19e273960f2eb86c297b8ae5209c91a80c95093933c99d5c79a5cb42340c410d')
options=('!debug')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 httpcode "$pkgdir/usr/bin/httpcode"
}
