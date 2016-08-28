# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=otf-bitstream-charter
pkgver=1.0
pkgrel=1
pkgdesc="Bitstream charter fonts"
arch=('any')
url="http://practicaltypography.com/charter.html"
license=('custom')
source=('http://practicaltypography.com/fonts/charter.zip')
md5sums=('b1816043444645ec6232534543a2ffa6')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 ${srcdir}/charter/otf/*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 ${srcdir}/charter/license.txt "${pkgdir}/usr/share/licenses/otf-bitstream-charter/LICENSE"
}
