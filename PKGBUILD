# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=('ffuf')

source=("https://github.com/ffuf/ffuf/releases/download/v${pkgver}/ffuf_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6b25182bff8fac00341b78b71a82c86e76d477bf730c6d4cf0af9923ee113fa3')

package() {
    cd $srcdir
    install -Dm755 ./ffuf "${pkgdir}/usr/bin/ffuf"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
