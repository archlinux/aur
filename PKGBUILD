# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="quattrocento-sans"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.0
pkgrel=2
pkgdesc="Classic, Elegant & Sober typeface, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/quattrocentosans/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig')
#install=updatefont.install
#source=("http://www.impallari.com/media/uploads/prosources/update-19-source.zip")
source=("Quattrocento_Sans.zip::https://fonts.google.com/download?family=Quattrocento+Sans")
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
