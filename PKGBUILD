# Maintainer: Mike Pento <mpento darkforge net>

pkgname=uefitool-bin
pkgver=A68
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
sha256sums=('67d0f93d9c5e764edd8e9d9afb04b4296ca7c3a89d1c2aab4c78fb8896d7e100'
            'f11ac277b01674c95f34082224d94a9234eae546b7c1d8efa786de583ef8f653'
            '28e36550711d242bc5f129bf075f6ddd9dbb12bd474f287578fc519be0eeff72')

package() {
  install -Dm755 "${srcdir}"/uefiextract "${pkgdir}/usr/bin/uefiextract"
  install -Dm755 "${srcdir}"/uefifind "${pkgdir}/usr/bin/uefifind"
  install -Dm755 "${srcdir}"/uefitool "${pkgdir}/usr/bin/uefitool"
}
# vim:set ts=2 sw=2 et:
