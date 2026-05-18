# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.22.0_x86_64.AppImage")
sha256sums_x86_64=('846324fdc00b107fe97d3f48d13f0be2c587739490afd26b45d6003380afd22f')

package() {
  chmod +x "${srcdir}/nova_0.22.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.22.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
