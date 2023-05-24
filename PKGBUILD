# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ente-desktop-bin
pkgver=1.6.30
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
sha256sums=('7babb8500d8983b38e14bc4c89f4eeba522104624421890b58194ca16b5ce369')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}