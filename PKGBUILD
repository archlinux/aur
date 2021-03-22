# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=otf-bitstream-charter
pkgver=20210112
pkgrel=2
pkgdesc="Bitstream charter fonts"
arch=('any')
url="http://practicaltypography.com/charter.html"
license=('custom')
source=("https://practicaltypography.com/fonts/Charter%${pkgver}.zip")
md5sums=('e37a9bcb03fdd18bb95b31e18a294dfa')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 "${srcdir}/Charter ${pkgver:2}/OTF format (best for Mac OS)/Charter/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/Charter ${pkgver:2}/Charter license.txt" "${pkgdir}/usr/share/licenses/otf-bitstream-charter/LICENSE"
}
