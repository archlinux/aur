# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gifgen
pkgver=1.1.2
pkgrel=1
pkgdesc='Simple high quality GIF encoding'
arch=('x86_64')
url="https://github.com/lukechilds/gifgen"
license=('MIT')
depends=('ffmpeg')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('2805fd101b71c19d7dca7cfb367ed29b')

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/gifgen "${pkgdir}/usr/bin/gifgen"
}
# vim:set ts=2 sw=2 et: