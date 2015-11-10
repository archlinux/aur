# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ttf-ti83symbols
pkgver=latest
pkgrel=1
pkgdesc="Key font for TI83"
arch=(any)
url="https://education.ti.com/"
license=('custom:proprietary')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-ti83symbols.install
source=("https://education.ti.com/~/media/05332A946BD34070B7DF0FFCA6B3919B")
md5sums=('b9106d7960706572160a1ab8596c3246')

package() {
  cd "${srcdir}"

  install -Dm644 "TI83____.TTF" "${pkgdir}/usr/share/fonts/TTF/TI83____.TTF"
  install -Dm644 "TI83____.PFB" "${pkgdir}/usr/share/fonts/Type1/TI83____.PFB"
  install -Dm644 "TI83____.PFM" "${pkgdir}/usr/share/fonts/Type1/TI83____.PFM"
  install -Dm644 "README.TXT" "${pkgdir}/usr/share/docs/${pkgname}/README.TXT"
  install -Dm644 "Ti83keys.txt" "${pkgdir}/usr/share/docs/${pkgname}/Ti83keys.txt"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/docs/${pkgname}/Ti83keys.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Ti83keys.txt"
}
