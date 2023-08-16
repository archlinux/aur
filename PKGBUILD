# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mapeo-desktop-bin
pkgver=5.6.0
pkgrel=5
pkgdesc="An offline map editing application for indigenous territory mapping in remote environments."
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'libxss' 'nodejs' 'alsa-lib' 'python' 'nss' 'at-spi2-core' 'libxcomposite' 'expat' 'libxtst' 'glib2' \
    'hicolor-icon-theme' 'libxrender' 'libxdamage' 'libx11' 'cairo' 'libxfixes' 'libdrm' 'libxi' 'pango' 'sh' 'gcc-libs' \
    'nspr' 'glibc' 'libxext' 'libxcb' 'gdk-pixbuf2' 'libcups' 'libxrandr' 'mesa' 'dbus' 'libxcursor')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.deb")
sha256sums=('8aa7aeae48e94ee2ac76cade08d553189ab32b0e0b2814fa97efab09a712cabd')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}