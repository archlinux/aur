# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.030
_betaver=1_030
pkgrel=1
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${url}/releases/download/${pkgver}/recursive-beta_${_betaver}--statics.zip"
"LICENSE::https://raw.githubusercontent.com/arrowtype/recursive/master/OFL.txt")
sha1sums=('d773eff38e2e25ddc9b26ed517db85c558a969c9'
          'f200de5d9656482b8d193adda52514b6402a3cfa')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/Recursive
  install -Dm644 ${srcdir}/recursive-beta_${_betaver}--statics/recursive-statics-four_way_split-static_ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/Recursive
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
