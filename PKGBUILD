# Maintainer: pmqueiroz <pedroqueiroz593@gmail.com>
pkgname=nova-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator"
arch=('x86_64')
url="https://github.com/pmqueiroz/nova"
license=('MIT')
depends=('libxkbcommon' 'wayland' 'libgl')
provides=('nova')
conflicts=('nova')
source_x86_64=("https://github.com/pmqueiroz/nova/releases/download/v${pkgver}/nova_${pkgver}_x86_64.AppImage")
sha256sums_x86_64=('SKIP')

package() {
    chmod +x "${srcdir}/nova_${pkgver}_x86_64.AppImage"
    install -Dm755 "${srcdir}/nova_${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/nova"
}
