# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.054
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
source=("${url}/releases/download/${pkgver}/ArrowType-Recursive-${pkgver}.zip")
sha256sums=('953612a4b105ce20db1fcedcce895a6d5ec0b17e6d30266eb87cc78dfe42578f')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Code/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Desktop/separate_OTF_TTF_statics/Static_TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
