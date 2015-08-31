# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-alegreya-sans
pkgver=1.002
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Alegreya Sans is a humanist sans serif family with a calligraphic feeling that conveys a dynamic and varied rhythm.'
arch=('any')
url='http://www.huertatipografica.com/en/fonts/alegreya-sans-ht'
license=('custom:OFL')
source=('http://www.huertatipografica.com/free_download/23')
install=${pkgname}.install
md5sums=('38224ce535dbc3002c6ecb1f956576d9')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
