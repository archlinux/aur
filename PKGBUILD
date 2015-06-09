# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname=otf-allerta
pkgver=1.001
pkgrel=1
pkgdesc="Allerta is an open source typeface designed for use in signage"
arch=('any')
license=('custom:OFL')
url="http://pixelspread.com/allerta/"
screenshot="http://pixelspread.com/allerta/large/allerta.jpg"
arch=('any')
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-allerta')
install=updatefont.install
source=("http://pixelspread.com/allerta/allerta.zip")
md5sums=('944ee51768a80bdbe822c2c2f0b8d6a1')

package() {
  cd ${srcdir}/A*

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 *.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 "Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Open_Font_License.txt"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 *.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
}
