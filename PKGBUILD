# Maintainer: Different AI <team@different.ai>
# AUR Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.3.4
pkgrel=1
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/different-ai/openwork/releases/download/v${pkgver}/openWork-desktop-linux-amd64.deb")
sha256sums=('16d1d02d508beacd0582be61a14b94cfdb6c0dca3c26ed83b0b2ffa2c619a07a')

package() {
  cd "${srcdir}"
  ar x "${pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "${pkgdir}"
}
