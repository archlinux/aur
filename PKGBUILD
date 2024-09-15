# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=apng2gif-bin
pkgver=1.8
pkgrel=1
pkgdesc='Convert APNG animations into animated GIF format'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/apng2gif'
license=('ZLIB')
provides=('apng2gif')
conflicts=('apng2gif' 'apng-utils')
depends=('lib32-gcc-libs'
         'lib32-libpng')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/apng2gif/files/${pkgver}/apng2gif-${pkgver}-bin-linux.zip/download")
sha256sums=('09b0c88dbd06f02617453ad225a56f3ea68dfd87cc165bd7ba18da3761c910e5')

package() {
  install -Dm755 apng2gif -t "${pkgdir}/usr/bin"
  install -Dm644 readme.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
