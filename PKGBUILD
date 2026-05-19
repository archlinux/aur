# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.24.0_x86_64.AppImage")
sha256sums_x86_64=('5e7871434d0f67bb4298a7005ba8f9676c6f300509815832264635497ba510ac')

package() {
  chmod +x "${srcdir}/nova_0.24.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.24.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
