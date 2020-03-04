#Maintainer: Lukas Erhard <luerhard@googlemail.com>

pkgname=remarkable-client
pkgver=0.0.5
pkgrel=1
arch=("any")
license=("unknown")

depends=('qt5-websockets')
source=("https://remarkable.engineering/remarkable-linux-client-0.0.5-16-1408-g7eca2b66.tgz")
sha256sums=("1a1519adc6d62359f6f73bc2a4a6e76fb710fed78ca1bc09e46191e825d3058c")

package() {
    install -D -m755 "${srcdir}/remarkable-linux-client-0.0.5-16-1408-g7eca2b66/reMarkable" "${pkgdir}/usr/bin/reMarkable"
    install -D -m755 "${srcdir}/remarkable-linux-client-0.0.5-16-1408-g7eca2b66/libpdfium.so.1" "${pkgdir}/usr/lib/libpdfium.so.1"
}
