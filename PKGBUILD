# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.35.3
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('aarch64' 'x86_64')
url='https://github.com/vektra/mockery'
license=("BSD")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "golang-${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('9b4f8053446e7776aa75adc056d8d3955a39cc46b046e63c50196a06acbb05ea')
sha256sums_x86_64=('d732135bb7082f84bb99f6768e61db4e768599ac6c2b749a88b958b906774c64')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}