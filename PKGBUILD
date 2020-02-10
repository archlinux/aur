# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="life-savers-handlettered-stymie"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=3.000
pkgrel=1
pkgdesc="1950's Life Savers Handlettered Stymie, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
#source=("http://www.impallari.com/media/uploads/prosources/update-101-source.zip")
source=("Life_Savers.zip::https://fonts.google.com/download?family=Life+Savers")
md5sums=('SKIP')

package() {
  cd ${srcdir}/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
