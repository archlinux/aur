# Contributor: Paul Nicholson <brenix@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yor-bin
pkgver=0.1.185
pkgrel=2
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
sha256sums_armv7h=('2ed37c9ea2d5a0b46f2b14f818ab16fa599418fbd38c9bc9598aca00f5cf8f74')
sha256sums_aarch64=('3940ea98a025c874691a091adb0fefa79a30e8c2a1592e47ecfdf172aa1bc6b2')
sha256sums_i686=('421d7573053ba60c63137548411f32111885410e55ea358f5bc9d016a9a9486e')
sha256sums_x86_64=('a6ddcae9eff7c86790caf042dfd331e0f91d657b4796b8523aa19c2c9c01deb1')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}