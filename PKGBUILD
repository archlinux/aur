# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.18.3_x86_64.AppImage")
sha256sums_x86_64=('6cafd2c57c49d20473934591aea0583d9ced9c1fd9fdb3a512fe412ef77efa7c')

package() {
  chmod +x "${srcdir}/nova_0.18.3_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.18.3_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
