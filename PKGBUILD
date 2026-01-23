# Maintainer: Parker Rowen <gitporker@gmail.com>
# Upstream Maintainer: Different AI <team@different.ai>
pkgname=openwork
pkgver=0.3.2
pkgrel=1
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
options=(!debug)
source=("${pkgname}-${pkgver}.deb::https://github.com/different-ai/openwork/releases/download/v${pkgver}/openWork-desktop-linux-amd64.deb")
sha256sums=('d651aae9587d8efaac066e4eb77d822e2000a36892d2243bbfe535633942c169')

package() {
  cd "${srcdir}"
  ar x "${pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "${pkgdir}"
}
