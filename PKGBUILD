# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=catcodec
pkgver=1.0.5
pkgrel=3
pkgdesc="A tool for decoding/encoding .cat files for OpenTTD"
arch=('i686' 'x86_64')
url="https://www.openttd.org/downloads/catcodec-releases/latest.html"
license=('GPL')
source=("https://cdn.openttd.org/catcodec-releases/1.0.5/catcodec-1.0.5-source.tar.xz")
sha256sums=('47ff4e6d663e19d529960c76f1e1bda5fe4cad97e2628381ec3a894ba260e0e1')
build() {
    cd ${srcdir}/$pkgname-$pkgver
    make prefix=/usr
}
package() {
    cd ${srcdir}/$pkgname-$pkgver
    make prefix=/usr DESTDIR="$pkgdir" install
}
