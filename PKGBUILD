# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.046
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${url}/releases/download/${pkgver}/Recursive-Beta_${pkgver}.zip")
sha256sums=('4e9cc7a2a74f2081e581ef7b9b7a7c252fd1c50a27c5c902c02d66e32243ce51')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp -a ${srcdir}/Recursive-Beta_${pkgver}/{Recursive_Code,Recursive_Desktop} "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-Beta_${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
