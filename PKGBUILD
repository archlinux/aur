# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v$pkgver/nova_0.23.0_x86_64.AppImage")
sha256sums_x86_64=('51aef79ea884a0747e164106b124a54b26478af4fe493d6e3ebc47e3471f8687')

package() {
  chmod +x "${srcdir}/nova_0.23.0_x86_64.AppImage"
  install -Dm755 "${srcdir}/nova_0.23.0_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
