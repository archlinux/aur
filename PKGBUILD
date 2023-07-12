# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.32.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('aarch64' 'x86_64')
url='https://github.com/vektra/mockery'
license=("BSD")
conflicts=("${pkgname%-bin}" "golang-${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('f59616be7f0f7ec7884a8a4f4aedfe55a6f680e553ea7fd5f57a37d2eafbbd73')
sha256sums_x86_64=('e3206225e516cfa69cc741f4bedbd0ace264c382aca58d733ddefb68abef45c1')
package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}