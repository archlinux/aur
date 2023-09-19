# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.33.3
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('aarch64' 'x86_64')
url='https://github.com/vektra/mockery'
license=("BSD")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "golang-${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('940501d2a20d9efc84591d36960a3728af401f106d9ad45332ac36ff91ed8206')
sha256sums_x86_64=('22df6b3b16cf7379d399b41c25c7397140ba5fc5bfff20cf1f99367f7c09c3a5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}