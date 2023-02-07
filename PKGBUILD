# Maintainer: Mike Pento <mpento darkforge net>

pkgname=uefitool-bin
pkgver=A63
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD')
provides=("uefitool=${pkgver}" "uefipatch=${pkgver}" "uefireplace=${pkgver}")
depends=('qt5-base')
source=("UEFIExtract-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIExtract_NE_${pkgver}_linux_x86_64.zip"
    "UEFIFind-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIFind_NE_${pkgver}_linux_x86_64.zip"
    "UEFITool-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFITool_NE_${pkgver}_linux_x86_64.zip")
sha256sums=('1c0ff218b541f3ce19c70e1b93b6ee0d3faafee401da82a2c558aeb2edc22e04'
            '167b06da54f7f8423685ff5071b0cdcc8dc69f34603c0491ac6d6474385a5995'
            '133ca02cd7475b58725dc19d0f1dad3362e56e91fd6c9f86231caba1606656f5')

package() {
  install -Dm755 "${srcdir}"/UEFIExtract "${pkgdir}/usr/bin/uefiextract"
  install -Dm755 "${srcdir}"/UEFIFind "${pkgdir}/usr/bin/uefifind"
  install -Dm755 "${srcdir}"/UEFITool "${pkgdir}/usr/bin/uefitool"
}
# vim:set ts=2 sw=2 et:
