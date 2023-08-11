# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ente-desktop-bin
pkgver=1.6.39
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
sha256sums=('96d87a0b98b45975f092578c125d52e23d4aa8e5306833fd766d305a16d53835')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}