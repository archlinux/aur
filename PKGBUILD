# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.2.1_x86_64.AppImage")
sha256sums_x86_64=('977b44d42e2e761b3c102ab4aaa302d260b8d436ccaf28f08d3dcd6d494c88aa')

package() {
  chmod +x "${srcdir}/nova_1.2.1_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.2.1_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
