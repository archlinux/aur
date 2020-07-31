# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.053
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
source=("${url}/releases/download/${pkgver}/Recursive-${pkgver}.zip")
sha256sums=('2ca57a015ce207d77260b2ab38d9f4292080696f5d531b431b08c88ce593b543')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Code/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  cp ${srcdir}/Recursive-${pkgver}/Recursive_Desktop/separate_OTF_TTF_statics/Static_TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
