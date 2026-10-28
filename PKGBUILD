# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.2.9
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
sha256sums=('fa123407ecf9618adfadeb7506904aa406518b4603c8dd6b3e629663ccd36f36')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
