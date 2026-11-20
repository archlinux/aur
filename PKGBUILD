# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.3.11
pkgrel=1
pkgdesc="Cross-platform media center for streaming and managing your media library"
arch=('x86_64')
url="https://github.com/FluxaMedia/fluxa"
license=('GPL-3.0-only')
depends=('glibc' 'vulkan-icd-loader')
provides=('fluxa-desktop')
conflicts=('fluxa-desktop')
options=('!strip')
source=("fluxa-desktop-${pkgver}.deb::${url}/releases/download/v${pkgver}/fluxa-${pkgver}-linux-amd64.deb")
sha256sums=('939da2d043db3128896ef7d7c4368d0a8de9dc1dfe7022fd9eb5483ea455f63b')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
