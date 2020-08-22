# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.057
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
source=("${url}/releases/download/${pkgver}/Recursive-${pkgver}.zip")
sha256sums=('bb624d63337abfef2026eecf148cc735fcf22b71de142afd14ba2b8d329fba1e')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Code/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Desktop/separate_statics/Static_TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
