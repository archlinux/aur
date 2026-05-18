# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.23.1_x86_64.AppImage")
sha256sums_x86_64=('ce3bedf181a5f739e14a4bc8673c5d9d08bf5c85baa98c5a312f43e3034246cb')

package() {
  chmod +x "${srcdir}/nova_0.23.1_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.23.1_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
