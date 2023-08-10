# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ente-desktop-bin
pkgver=1.6.37
pkgrel=1
pkgdesc="Desktop app for ente Photos"
arch=('x86_64')
url="https://github.com/ente-io/photos-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'alsa-lib' 'libdrm' 'libxcb' 'libxcomposite' 'libx11' 'libxkbcommon' 'libxext' 'gcc-libs' 'glibc' 'cairo' 'gtk3' 'wayland' \
    'libxrandr' 'hicolor-icon-theme' 'zlib' 'libxfixes' 'nss' 'pango' 'at-spi2-core' 'expat' 'dbus' 'nspr' 'libxdamage' 'mesa' 'libcups')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver//_/-}/${pkgname%-desktop-bin}-${pkgver}.pacman")
sha256sums=('940f60b74855709febb63343e938c2c097ba323afea56b30f74a57183c54d223')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}