# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.33.2
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('aarch64' 'x86_64')
url='https://github.com/vektra/mockery'
license=("BSD")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "golang-${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('7246da7ba91d889dabcbb43a777d897baedc7ff71e1685f1af6aea70abb9fcb3')
sha256sums_x86_64=('52f05dc9da4507a8f1ec5f25be1f097aeda788d00a2615ed408894021c947ef7')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}