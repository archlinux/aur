# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apngasm-bin
pkgver=2.91
pkgrel=1
pkgdesc='Creates APNG animation from PNG/TGA image sequence'
arch=('x86_64')
url='https://sourceforge.net/projects/apngasm'
license=('ZLIB')
provides=('apngasm')
conflicts=('apngasm' 'apng-utils')
depends=('libpng')
source=("${pkgname}-${pkgver}.zip::https://netix.dl.sourceforge.net/project/apngasm/${pkgver}/apngasm-${pkgver}-bin-linux.zip")
sha256sums=('91f27aad17f8abc5bc197febd24cfa9dce081d280a8e60df1437139e74a93045')

package() {
  install -Dm755 apngasm -t "${pkgdir}/usr/bin"
  install -Dm644 readme.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
