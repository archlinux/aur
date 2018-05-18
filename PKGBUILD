# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="cantora"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.001
pkgrel=2
pkgdesc="Cantora ('Singer' in Spanish) is a friendly semi formal, semi condensed, semi sans serif, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("Cantora_One.zip::https://fonts.google.com/download?family=Cantora%20One")
md5sums=('4d93b79fe62c2a6aaf0e0f41b1e152e6')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
