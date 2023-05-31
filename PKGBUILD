# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ente-desktop-bin
pkgver=1.6.31
pkgrel=1
pkgdesc="Desktop app for ente Photos"
arch=('x86_64')
url="https://github.com/ente-io/photos-desktop"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glib2' 'alsa-lib' 'libdrm' 'libxcb' 'libxcomposite' 'libx11' 'libxkbcommon' 'libxext' 'gcc-libs' 'glibc' 'nodejs' 'cairo' 'gtk3' \
    'libxrandr' 'hicolor-icon-theme' 'zlib' 'libxfixes' 'nss' 'pango' 'at-spi2-core' 'wayland' 'expat' 'dbus' 'nspr' 'libxdamage' 'mesa' 'libcups')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-desktop-bin}-${pkgver}.pacman")
sha256sums=('592f7d603d3e678b7f3681a20fdfde25ce064f8d11e7b1745efb0f1462cded9f')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}