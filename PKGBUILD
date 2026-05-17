# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.21.1_x86_64.AppImage")
sha256sums_x86_64=('8f703d74f863445265a92845e7666d33740fe721b110bc93681b8dd50685f2aa')

package() {
  chmod +x "${srcdir}/nova_0.21.1_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.21.1_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
