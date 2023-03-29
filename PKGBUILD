# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
_pkgname=ffuf
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=2
pkgdesc="Fast web fuzzer written in Go"
arch=('x86_64')
url="https://github.com/ffuf/ffuf"
license=(MIT)
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6055a909159970f9a23ff249f67634304f2910df4ec94b1a66381742a85c4ccf')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}