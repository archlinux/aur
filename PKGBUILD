# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gifgen
pkgver=1.2.0
pkgrel=1
pkgdesc='Simple high quality GIF encoding'
arch=('any')
url="https://github.com/lukechilds/gifgen"
license=('MIT')
depends=('ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'LICENSE::https://raw.githubusercontent.com/lukechilds/gifgen/master/LICENSE')
sha256sums=('6a92d5e6ae8ad1ff2b066e3fe6379b4c0961ff4eb769e05a9cd3796d95bd76cc'
            'f23faa8280084d44d2282a44d142fa439fed491cb52f367a8fedb8f1f17ed511')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/gifgen" "${pkgdir}/usr/bin/gifgen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}
# vim:set ts=2 sw=2 et:
