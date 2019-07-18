# Maintainer: Kevin Del Castillo R. <lans9831@gmail.com>

pkgname=vintage-basic
epoch=1
pkgver=1.0.3
pkgrel=1
pkgdesc='Vintage BASIC Interpreter'
arch=('x86_64')
url='http://vintage-basic.net'
license=('BSD')
source=("http://vintage-basic.net/downloads/vintage-basic-$pkgver-linux-x86_64.tar.gz")
sha512sums=(SKIP)

package() {
    cd "${srcdir}/vintage-basic-$pkgver-linux-x86_64"
    cp -r share "${pkgdir}/usr/"
    mkdir -p "${pkgdir}/usr/bin"
    install bin/vintbas "${pkgdir}/usr/bin"
}
