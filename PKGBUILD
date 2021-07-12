# Maintainer: Jorengarenar

pkgname=vintage-basic-bin
pkgver=1.0.3
pkgrel=3
pkgdesc='Vintage BASIC Interpreter'
arch=('x86_64')
url='http://vintage-basic.net'
license=('BSD')
source=("http://vintage-basic.net/downloads/vintage-basic-$pkgver-linux-x86_64.tar.gz")
sha512sums=('c654209689c25098f6321fb47c2a46a2cc562358b12c746d71b5e6c2e52cb86cb8887233d3684ed355dbddb585d9eca571b220536a90c60e00e83d25ad1bd39c')

package() {
    cd "${srcdir}/vintage-basic-$pkgver-linux-x86_64"
    cp -r share "${pkgdir}/usr/"
    mkdir -p "${pkgdir}/usr/bin"
    install bin/vintbas "${pkgdir}/usr/bin"
}
