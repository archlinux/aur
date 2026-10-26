# Maintainer: KhooLy <seslikitapicinkhooly@gmail.com>
pkgname=fluxa-desktop-bin
pkgver=0.2.6
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
sha256sums=('76a687892848c2d8f7f50d2ae721706d59a031d9061363ffceda827a539747b6')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
