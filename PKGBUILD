# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgname=ttf-brill
pkgdesc="Brill Typeface by John Hudson for Brill Publishing House (TrueType)"
pkgver=2.06
pkgrel=1
url="http://www.brill.com/about/brill-fonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install
_ucpkgver=${pkgver//./_}
_completeversion="2.06 051"

source=("http://www.brill.com/sites/default/files/brill_font_package_${_ucpkgver}.zip")
sha256sums=('b58eeb26ea43d9a020ac9891a395ff7364bac7215d0714910561b675e4947166')

package() {
  install -D "${srcdir}/Brill_Typeface_${pkgver}/Brill Roman ${_completeversion}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/Brill-Roman.ttf"
  install -D "${srcdir}/Brill_Typeface_${pkgver}/Brill Italic ${_completeversion}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/Brill-Italic.ttf"
  install -D "${srcdir}/Brill_Typeface_${pkgver}/Brill Bold ${_completeversion}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/Brill-Bold.ttf"
  install -D "${srcdir}/Brill_Typeface_${pkgver}/Brill Bold Italic ${_completeversion}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/Brill-BoldItalic.ttf"
  install -D "${srcdir}/Brill_Typeface_${pkgver}/00_Brill_Fonts_Read_Me_First.txt" "${pkgdir}/usr/share/licenses/${pkgname}/end_user_license.txt"
  install -D "${srcdir}/Brill_Typeface_${pkgver}/Brill_Typeface_User_Guide_${pkgver}.pdf" "${pkgdir}/usr/share/doc/${pkgname}/Brill_Typeface_User_Guide.pdf"
}
