# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=('ffuf')

source=("https://github.com/ffuf/ffuf/releases/download/v${pkgver}/ffuf_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5d17df4fcef849224614810682320088b65af19b6db8f3d4d1bdeac72a594695')

package() {
    cd $srcdir
    install -Dm755 ./ffuf "${pkgdir}/usr/bin/ffuf"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
