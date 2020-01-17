# Maintainer: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=0.12
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=('ffuf')

source=("https://github.com/ffuf/ffuf/releases/download/v${pkgver}/ffuf_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1388791e80caefd8dc0e8df05aa74fbc37ccdc48472a6b8b056b2599ba8f4378')

package() {
    cd $srcdir
    install -Dm755 ./ffuf "${pkgdir}/usr/bin/ffuf"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}