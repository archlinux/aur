# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gif2apng-bin
pkgver=1.9
pkgrel=1
pkgdesc='Convert GIF animations into APNG format'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/gif2apng'
license=('ZLIB')
provides=('gif2apng')
conflicts=('gif2apng')
depends=('lib32-gcc-libs'
         'lib32-zlib')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/gif2apng/files/${pkgver}/gif2apng-${pkgver}-bin-linux.zip/download")
sha256sums=('46cc47946d21fb412dc7b3d4d267a4783204e6205112ad904c5c6b6f23c2c1ed')

package() {
  install -Dm755 gif2apng -t "${pkgdir}/usr/bin"
  install -Dm644 readme.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et: