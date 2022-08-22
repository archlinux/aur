# Maintainer: Sam Tay <sam dot chong dot tay at pm dot me>

pkgname=so-bin
pkgver=0.4.8
pkgrel=1
pkgdesc="A terminal interface for StackOverflow"
provides=('so')
conflicts=('so' 'so-git')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/samtay/so"
license=(MIT)

source=(LICENSE::${url}/raw/v${pkgver}/LICENSE)
source_x86_64=(archive-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/so-x86_64-unknown-linux-gnu.tar.gz)
source_aarch64=(archive-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/so-aarch64-unknown-linux-gnu.tar.gz)
source_armv7h=(archive-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/so-armv7-unknown-linux-gnueabihf.tar.gz)

sha256sums=(SKIP)
sha256sums_x86_64=('4e531609e4c48a9ef131c00073faf49aa170620aa5b7c195dc3d0720e47fdfef')
sha256sums_aarch64=('4e531609e4c48a9ef131c00073faf49aa170620aa5b7c195dc3d0720e47fdfef')
sha256sums_armv7h=('4e531609e4c48a9ef131c00073faf49aa170620aa5b7c195dc3d0720e47fdfef')

package() {
    install -Dm755 so "$pkgdir"/usr/bin/so
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
