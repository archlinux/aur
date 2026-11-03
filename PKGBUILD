# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.3.0_x86_64.AppImage")
sha256sums_x86_64=('3f8ec53cf56c6f2cfe03b1b9e9d255090601831e36e64b79c6b5d907b327e08d')

package() {
  chmod +x "${srcdir}/nova_1.3.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.3.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
