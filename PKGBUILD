# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=orange-cat-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='A Markdown previewer written in Go'
arch=('x86_64')
url="https://github.com/utatti/orange-cat"
license=('MIT')
provides=('orange-cat' 'orange')
source=("${pkgname}-${pkgver}.zip::https://github.com/utatti/orange-cat/releases/download/v${pkgver}/orange_linux_amd64.zip"
        'LICENSE::https://github.com/utatti/orange-cat/raw/master/LICENSE')
sha256sums=('34ab47cf6c633d5cd1e5284f8b233cc2c97599d592c15bc56481ca269b069e35'
            '81f161dacf7704608b88852606cc27b1ddd4fd4b0f69a7b14ee9bcf460e19c6d')

package() {
  install -Dm755 "${srcdir}/orange" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: