# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=sbf_flash
pkgver=1.24
pkgrel=2
pkgdesc="Linux util for flashing sbf files"
url="http://opticaldelusion.org"
arch=('i686' 'x86_64')
license=('custom')
# original_source=("http://dl.opticaldelusion.org/sbf_flash?attredirects=0")
source=(sbf_flash::'https://web.archive.org/web/20200929120918if_/http://dl.opticaldelusion.org/sbf_flash')
sha256sums=('e8bd371dd9ab4dd1a38881390b392895d3f1cfde7c8d14187b096b63a7d2b8d0')

prepare () {
  cd ${srcdir}
}
package () {
  cd ${srcdir}
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
