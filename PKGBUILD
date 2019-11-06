# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.022
pkgrel=1
_betaver=1_022
_fontname=recursive-MONO_CASL_wght_slnt_ital
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::${url}/releases/download/v${pkgver}/recursive-beta_${_betaver}.zip"
"LICENSE::https://raw.githubusercontent.com/arrowtype/recursive/master/OFL.txt")
sha1sums=('7a5d854c61ac2ea41ab7078cc4921f5ecd6432a0'
          'f200de5d9656482b8d193adda52514b6402a3cfa')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/font_betas/${_fontname}*.ttf ${pkgdir}/usr/share/fonts/TTF/${_fontname}.ttf
  install -D -m644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
