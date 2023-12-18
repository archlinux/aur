# Contributor: Paul Nicholson <brenix@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yor-bin
pkgver=0.1.187
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it."
arch=(
    'armv7h'
    'aarch64'
    'i686'
    'x86_64'
)
url="https://www.yor.io/"
_ghurl="https://github.com/bridgecrewio/yor"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_armv7h=('07a6ce9aee9e4adc0fb9bb3d92de113775f37914ad3ed1933f9441a21c416edc')
sha256sums_aarch64=('d2d2bce71294e537a24cc5a97201688ddf6b8b6bdfacbc6c1836dccef021aff2')
sha256sums_i686=('65d3ff31d8b3766ddfe9cfb7601e89553b047296042a26d0dc905e10450e428a')
sha256sums_x86_64=('c943ef4320bcd392c8ff679e85aa9fa6672529aff5ead6dcae5ab782b40c5e3c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}