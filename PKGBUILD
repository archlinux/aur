# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.079
pkgrel=2
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('OFL')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('2ceb98649200c4f4cac06e43748a447de41540f9f8895a8d090af10e6beae282')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
