# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.072
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('3850f78fbc3360010267a24a3d9b6141146206e2efb505322941209c132ea756')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Code/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
