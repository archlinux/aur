pkgname=fafind-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Fast parallel filesystem search by filename"
arch=('x86_64' 'aarch64')
url="https://github.com/rywils/fafind"
license=('MIT')
provides=('fafind')
conflicts=('fafind')

source_x86_64=("fafind-x86_64.tar.gz::https://github.com/rywils/fafind/releases/download/v${pkgver}/fafind-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("fafind-aarch64.tar.gz::https://github.com/rywils/fafind/releases/download/v${pkgver}/fafind-linux-arm64-v${pkgver}.tar.gz")

sha256sums_x86_64=('1bc6c02ac9f7a9203320b0bc7723767c89ec96633e0063df4cd19472e56e4ba0')
sha256sums_aarch64=('60b358eb2c421ac3299467ad6279c4a3b087be209adde7e1590be83489e91edf')

package() {
    install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
}
