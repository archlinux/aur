# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mapeo-desktop-bin"
pkgver=5.6.0
pkgrel=3
pkgdesc="An offline map editing application for indigenous territory mapping in remote environments."
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=(GPL3)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('gtk3' 'libxss' 'nodejs' 'alsa-lib' 'python' 'nss' 'at-spi2-core' 'libxcomposite' \
    'hicolor-icon-theme' 'libxrender' 'libxdamage' 'libx11' 'cairo' 'libxfixes' 'libdrm' 'libxi' \
    'nspr' 'glibc' 'libxext' 'libxcb' 'gdk-pixbuf2' 'libcups' 'libxrandr' 'mesa' 'dbus' 'libxcursor' \
    'expat' 'libxtst' 'pango' 'sh' 'glib2' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.deb")
sha256sums=('8aa7aeae48e94ee2ac76cade08d553189ab32b0e0b2814fa97efab09a712cabd')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}