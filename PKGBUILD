# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Uli Armbruster <uli armbruster goole mail service>

pkgname=neroaacdec
pkgver=1.5.4
_pkgver=1.5.1
pkgrel=4
arch=('x86_64')
pkgdesc="Nero AAC reference quality MPEG-4 and 3GPP audio codec"
url='http://www.nero.com'
depends_i686=('gcc-libs')
depends_x86_64=('lib32-gcc-libs')
license=("custom")
source=("https://web.archive.org/web/20160923100008/http://ftp6.nero.com/tools/NeroAACCodec-${_pkgver}.zip")
sha256sums=('e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b')

package() {
  install -D -m755 linux/neroAacDec "${pkgdir}/usr/bin/neroAacDec"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/neroaacdec/LICENSE"
}
