# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_1.2.0_x86_64.AppImage")
sha256sums_x86_64=('e52cd32321abec632b0e9ea1d8afd3b5a9814bd8fe355fde0eb408b4a040367f')

package() {
  chmod +x "${srcdir}/nova_1.2.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_1.2.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
