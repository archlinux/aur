# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.3.1
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
sha256sums=('10409a5f0dcc4fff85204edc025682023597d18d269f9ed78671f57bc1b85abd')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
