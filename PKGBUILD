# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=2.0.0
pkgrel=5
pkgdesc="Fast web fuzzer written in Go"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('459c74a8b69b37503917a1fd4501fab374f043479ecf7c4ec5c0e7d537e43be1')
sha256sums_armv6h=('352dc044ed6a9ccd5c54c31efe5e57a0c8a9ca0b67caad4efd83e65a4cd18127')
sha256sums_armv7h=('459c74a8b69b37503917a1fd4501fab374f043479ecf7c4ec5c0e7d537e43be1')
sha256sums_i686=('8e1c8f142687830f7859c9dbbd86fe2210a8383206d58608c716cd063bb9b460')
sha256sums_x86_64=('6055a909159970f9a23ff249f67634304f2910df4ec94b1a66381742a85c4ccf')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}