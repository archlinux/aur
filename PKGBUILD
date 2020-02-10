# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="ranchers"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="'Relaxed interpretations' of sans serif typefaces typical of 1950, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/ranchers"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
#source=("http://www.impallari.com/media/uploads/prosources/update-69-source.zip")
source=("Ranchers.zip::https://fonts.google.com/download?family=Ranchers")
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
