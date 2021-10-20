# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=otf-recursive
pkgver=1.082
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('OFL')
_srcname=ArrowType-Recursive
source=("${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.zip")
sha256sums=('24c08f2967ccb6c8629f19c433eb71bebf898242cb81dc9dbb4399af361c7deb')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/Recursive
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  cp ${srcdir}/${_srcname}-${pkgver}/Recursive_Desktop/separate_statics/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/Recursive"
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
