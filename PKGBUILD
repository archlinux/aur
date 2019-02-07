# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="hermeusone"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.002
pkgrel=1
pkgdesc="Hermeneus is a grecian style font, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("hermeneus_one.zip::https://dl.dafont.com/dl/?f=hermeneus_one")
md5sums=('03ab2e294830c9820a5a0e408640ed52')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  #install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  #install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
