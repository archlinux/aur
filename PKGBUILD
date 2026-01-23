# Maintainer: Different AI <team@different.ai>
# AUR Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.3.5
pkgrel=1
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/different-ai/openwork/releases/download/v${pkgver}/openWork-desktop-linux-amd64.deb")
sha256sums=('01b7f2fe78d870143b7b370e1b569cea218bfaa0549c4af32ab495a5ee3d349f')

package() {
  cd "${srcdir}"
  ar x "${pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "${pkgdir}"
}
