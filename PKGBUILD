# Maintainer: Different AI <team@different.ai>
# AUR Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.3.6
pkgrel=1
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/different-ai/openwork/releases/download/v${pkgver}/openWork-desktop-linux-amd64.deb")
sha256sums=('991cd6f6eaa3d871de42b6016b58c69360fceeea4f23a9c82b0101a98252b6c8')

package() {
  cd "${srcdir}"
  ar x "${pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "${pkgdir}"
}
