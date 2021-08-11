# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.079
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('OFL')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('e8499836cb7656d33d82ebbf4a24c8a660ceaa69909849764b93d7fa251c9053')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
