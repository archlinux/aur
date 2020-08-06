# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.054
pkgrel=2
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
source=("${url}/releases/download/${pkgver}/ArrowType-Recursive-${pkgver}.zip")
sha256sums=('98674d3b4af6a39e71bfab56504add737890ef2e067358d179fe038b6fcb9281')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Code/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Desktop/separate_OTF_TTF_statics/Static_TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
