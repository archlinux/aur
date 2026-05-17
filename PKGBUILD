# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.20.0_x86_64.AppImage")
sha256sums_x86_64=('e9ebf2399b9c4f7bcda871bfda27f38de41d4ba28f4d6e442147432bc217a585')

package() {
  chmod +x "${srcdir}/nova_0.20.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.20.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
