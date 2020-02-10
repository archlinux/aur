# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="racing-sans"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.1
pkgrel=1
pkgdesc="Racing Sans, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
#source=("http://www.impallari.com/media/uploads/prosources/update-53-source.zip")
source=("Racing_Sans.zip::https://fonts.google.com/download?family=Racing+Sans+One")
md5sums=('SKIP')

package() {
  cd ${srcdir}/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt *.jpg "${pkgdir}/usr/share/doc/${pkgname}/"
}
