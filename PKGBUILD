# Maintainer: chongli <kurto@mac.com>
pkgname=otf-montserrat
pkgver=0.1
pkgrel=1
pkgdesc="Often compared to Proxima Nova for it's charming utility, Montserrat is a useful typeface, loved by many web and UI designers. Designed by Julieta Ulanovsky."
arch=('any')
url="https://www.fontsquirrel.com/fonts/montserrat"
license=('custom:SIL')
provides=('otf-montserrat')
source=('https://www.fontsquirrel.com/fonts/download/montserrat')
sha256sums=('97fd7abc401f2716ce2dac4731dbf6c141abc8fb58702aeb93c599db7caa4e58')

package() {

  install -D -m644 "SIL Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 Montserrat-*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 MontserratAlternates-*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

