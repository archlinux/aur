# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.23.2_x86_64.AppImage")
sha256sums_x86_64=('6ea65afdaa62a993b09a301aa061b24193599f3f08f7b516556b3d3605090b71')

package() {
  chmod +x "${srcdir}/nova_0.23.2_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.23.2_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
