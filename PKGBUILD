# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="quattrocento"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.000
pkgrel=3
pkgdesc="Classic, Elegant, Sober and Strong typeface, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/${_font}/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig')
#install=updatefont.install
#source=("http://www.impallari.com/media/releases/${_font}-v${pkgver}.zip")
#source=("http://www.impallari.com/media/uploads/prosources/update-20-source.zip")
source=("Quattrocento.zip::https://fonts.google.com/download?family=Quattrocento")
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
