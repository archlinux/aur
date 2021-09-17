# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font='cantora'
_group='impallari'
pkgname=ttf-${_group}-${_font}
pkgver=1.001
pkgrel=5
pkgdesc="Cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, semi–sans-serif font, from Pablo Impallari"
arch=(any)
url='https://fonts.google.com/specimen/Cantora+One'
license=('OFL')
groups=("${_group}-fonts")
source=("Cantora_One.zip::https://fonts.google.com/download?family=Cantora%20One")
sha256sums=('e117ac04349b3b31d08dcc6cf9a31c61ceb508423bdf0f2193aa41e307af9ae9')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
