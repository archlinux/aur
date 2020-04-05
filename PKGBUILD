# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.047
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${url}/releases/download/${pkgver}/Recursive-Beta_${pkgver}.zip")
sha256sums=('e5e89b7aab036b0c39c48fa1df139cf08132d35c834115e9116ff94bb8922e9b')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp -a ${srcdir}/Recursive-Beta_${pkgver}/{Recursive_Code,Recursive_Desktop} "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-Beta_${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
