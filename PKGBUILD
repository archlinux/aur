# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.029
pkgrel=1
_betaver=2019_12_17-23_21
_fontname=recursive-MONO_CASL_wght_slnt_ital
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${_fontname}.ttf::${url}/releases/download/v${pkgver}/${_fontname}--full_gsub--${_betaver}.ttf"
"LICENSE::https://raw.githubusercontent.com/arrowtype/recursive/master/OFL.txt")
sha1sums=('dc75705e1c7bf341ec0059aef86b7052e17d1a12'
          'f200de5d9656482b8d193adda52514b6402a3cfa')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fontname}.ttf ${pkgdir}/usr/share/fonts/TTF/${_fontname}.ttf
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
