# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.0.0_x86_64.AppImage")
sha256sums_x86_64=('66ea02eed2269cc44abdefbb2a7f610b40ea271468eebec2a2840464397d73e1')

package() {
  chmod +x "${srcdir}/nova_1.0.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.0.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
