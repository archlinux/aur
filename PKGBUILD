# Maintainer: Mike Pento <mpento darkforge net>

pkgname=uefitool-bin
pkgver=A66
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD')
provides=("uefitool=${pkgver}" "uefipatch=${pkgver}" "uefireplace=${pkgver}")
depends=('qt6-base')
source=("UEFIExtract-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIExtract_NE_${pkgver}_x64_linux.zip"
    "UEFIFind-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIFind_NE_${pkgver}_x64_linux.zip"
    "UEFITool-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFITool_NE_${pkgver}_x64_linux.zip")
sha256sums=('a8effffa85411a0b6318285511af2e71d572b6374d4ee15320b6a78727428651'
            '3297c90bdbf2b8c2fa6f2ed65c7938832e45826a60c02cd816a154d0abe2dd9b'
            'dada149eb2f263b70b67ac76ac57edd406c08d6a4115c25338f22948f2587166')

package() {
  install -Dm755 "${srcdir}"/uefiextract "${pkgdir}/usr/bin/uefiextract"
  install -Dm755 "${srcdir}"/uefifind "${pkgdir}/usr/bin/uefifind"
  install -Dm755 "${srcdir}"/uefitool "${pkgdir}/usr/bin/uefitool"
}
# vim:set ts=2 sw=2 et:
