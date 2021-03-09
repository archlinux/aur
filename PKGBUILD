# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.074
pkgrel=2
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('ef897b49a7a12ddb19d057fda4d666c1c75aaa8ad10f655dd3af477199223484')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
