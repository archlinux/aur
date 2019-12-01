# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-recursive
pkgver=1.027
pkgrel=1
_betaver=2019_11_30-20_07
_fontname=recursive-MONO_CASL_wght_slnt_ital
pkgdesc="A variable type family built for better code & UI"
arch=('any')
url="https://github.com/arrowtype/recursive"
license=('custom:SIL Open Font License 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${_fontname}.ttf::${url}/releases/download/${pkgver}/${_fontname}--full_gsub--${_betaver}.ttf"
"LICENSE::https://raw.githubusercontent.com/arrowtype/recursive/master/OFL.txt")
sha1sums=('3931572788316b864f4ebe0f9687139da7710a3e'
          'f200de5d9656482b8d193adda52514b6402a3cfa')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fontname}.ttf ${pkgdir}/usr/share/fonts/TTF/${_fontname}.ttf
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
