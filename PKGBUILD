# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.18.2
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.18.2_x86_64.AppImage")
sha256sums_x86_64=('fc9454d85bbe2c613b23980c8fcfc8642ebfcb1519f4416b9481ff38a24826f3')

package() {
  chmod +x "${srcdir}/nova_0.18.2_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.18.2_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
