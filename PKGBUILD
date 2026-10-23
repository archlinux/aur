# Maintainer: William Varmus <0@willvar.tw>

pkgname=ttf-michelangelus
pkgver=1.10
pkgrel=1
pkgdesc='Serif fonts inspired by Michelangelo, designed by Studiogusto'
arch=('any')
url='https://learn.microsoft.com/en-us/typography/font-list/michelangelus'
license=('LicenseRef-Microsoft-Michelangelus')
source=(
  "${pkgname}-${pkgver}.zip::https://download.microsoft.com/download/e8912dd7-c7e6-4ca1-a36b-c121d3fb238f/Michelangelus%20Fonts.zip"
)
sha256sums=('eef25b7cf00c24f63a59aea159671968e7490b233c58dc00c2cdcfdba049dc84')

package() {
  install -Dm644 "${srcdir}"/Michelangelus-*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 "${srcdir}/Michelangelus Fonts EULA.rtf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
}
