# Maintainer: Benjamin Goodger <ben at goodger dot nl>
# Contributor: Marcos Heredia <chelqo at gmail dot com>

pkgname=otf-allerta

pkgver=1.001
pkgrel=2

pkgdesc="Open-source signage typeface"
arch=('any')
url="https://pixelspread.com/allerta/"
license=('OFL')
_screenshot="http://pixelspread.com/allerta/large/allerta.jpg"

conflicts=('ttf-allerta')

source=("https://pixelspread.com/allerta/allerta.zip")

md5sums=('944ee51768a80bdbe822c2c2f0b8d6a1')

package() {
  cd ${srcdir}/Allerta

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/allerta"
  install -Dpm644 *.otf "${pkgdir}/usr/share/fonts/OTF/allerta/"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dpm644 "Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 *.pdf "${pkgdir}/usr/share/doc/${pkgname}/"
}
