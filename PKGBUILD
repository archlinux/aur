# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.1.1_x86_64.AppImage")
sha256sums_x86_64=('597219ea45f6542ede7230d636b462c32ff385c95d13ac4ad33edb6d797c9f75')

package() {
  chmod +x "${srcdir}/nova_1.1.1_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.1.1_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
