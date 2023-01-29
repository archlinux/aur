# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=('ffuf')

source=("https://github.com/ffuf/ffuf/releases/download/v${pkgver}/ffuf_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c1d6436760e9cfa5fc30c3cc79b546ed07b52687d00b4e53e476452cbb10ae3a')

package() {
    cd $srcdir
    install -Dm755 ./ffuf "${pkgdir}/usr/bin/ffuf"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
