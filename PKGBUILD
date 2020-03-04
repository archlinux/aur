# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.043
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${url}/releases/download/${pkgver}/Recursive-Beta_${pkgver}.zip")
sha256sums=('df4d38e1bc5deb59e1a2ddf00782e1a76fc1779acb97c06a834cbc305a0244c9')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  cp -a ${srcdir}/Recursive-Beta_${pkgver}/{Recursive_Code,Recursive_Desktop} "${pkgdir}/usr/share/fonts/TTF/Recursive"
  install -Dm644 "${srcdir}/Recursive-Beta_${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
