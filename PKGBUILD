# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=otf-bitstream-charter
pkgver=1.0
pkgrel=2
pkgdesc="Bitstream charter fonts"
arch=('any')
url="http://practicaltypography.com/charter.html"
license=('custom')
source=("https://practicaltypography.com/fonts/Charter%20200512.zip")
md5sums=('1d51f60c9ba6ccab0316f2d7ff836815')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 "${srcdir}/Charter/Charter/OpenType/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/Charter/Charter license.txt" "${pkgdir}/usr/share/licenses/otf-bitstream-charter/LICENSE"
}
