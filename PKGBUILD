# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ludusavi
pkgver=0.8.0
pkgrel=1
pkgdesc='Backup tool for PC game saves'
arch=('i686' 'x86_64')
url='https://github.com/mtkennerly/ludusavi'
license=('MIT')
depends=('gcc-libs' 'libxcb' 'fontconfig')
source=("${pkgname}-${pkgver}.zip::https://github.com/mtkennerly/ludusavi/releases/download/v${pkgver}/ludusavi-v${pkgver}-linux.zip"
        'LICENSE::https://github.com/mtkennerly/ludusavi/raw/master/LICENSE')
sha256sums=('75ad21600a41d003d859c336ec2ca94a2662283c3af2363cdaef82a5d869a4ab'
            'dba5a9bdc2280142b90a68fcd76134f48e6c765f14bfde7356b19b55370b27aa')

package() {
  install -Dm755 ludusavi -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/ludusavi"
}