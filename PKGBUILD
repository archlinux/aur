# Maintainer: Johann CAHIER <johann.cahier@iot.bzh>
pkgname=mustach
pkgver=0.99
pkgrel=1
description="mustach is a C implementation of the mustache template specification.
See : http://mustache.github.io/"
arch=('x86_64')
url="https://gitlab.com/jobol/mustach/"
license=('Apache-2.0')
depends=('json-c')
makedepends=('gcc' 'make' 'json-c')
checkdepends=()
optdepends=()
provides=('mustach')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/jobol/mustach/-/archive/0.99/mustach-0.99.zip")
noextract=()
md5sums=('c36a37d9e46c7db1225853c7fb207265')
validpgpkeys=()


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
#    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-2.0.txt"
}
