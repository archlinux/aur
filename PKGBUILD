# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.1.0_x86_64.AppImage")
sha256sums_x86_64=('eecdebcbd12869b76ae3b5cb8e5d16d78f5a14f8df84541f1f3165e594fdd097')

package() {
  chmod +x "${srcdir}/nova_1.1.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.1.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
