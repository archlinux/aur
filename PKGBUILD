# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.3.9
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
sha256sums=('926d18075904c7c47b74b137ba9bd26cd5478497338e589d1a41b092f1e26a0c')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
