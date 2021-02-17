# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.074
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('5ef8b941cbad013a25447c9856a956211871724a373e4238017baf061dea6873')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
