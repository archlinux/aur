# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ludusavi
pkgver=0.9.0
pkgrel=1
pkgdesc='Backup tool for PC game saves'
arch=('i686' 'x86_64')
url='https://github.com/mtkennerly/ludusavi'
license=('MIT')
depends=('gcc-libs' 'libxcb' 'fontconfig')
source=("${pkgname}-${pkgver}.zip::https://github.com/mtkennerly/ludusavi/releases/download/v${pkgver}/ludusavi-v${pkgver}-linux.zip"
        'LICENSE::https://github.com/mtkennerly/ludusavi/raw/master/LICENSE')
sha256sums=('f4fb10534541dc8cc0e690a8607aedaf3b044dd1f7c620d4ebb6fdc073a30179'
            'dba5a9bdc2280142b90a68fcd76134f48e6c765f14bfde7356b19b55370b27aa')

package() {
  install -Dm755 ludusavi -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/ludusavi"
}