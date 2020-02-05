# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=('ffuf')

source=("https://github.com/ffuf/ffuf/releases/download/v${pkgver}/ffuf_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ad5050dbd4fe8ec612843f6d0479f8d5485c40f90ef98d024f0b81aa97b368a5')

package() {
    cd $srcdir
    install -Dm755 ./ffuf "${pkgdir}/usr/bin/ffuf"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
