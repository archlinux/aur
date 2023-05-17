# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boats-animator-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Stop motion animation program created using Electron"
arch=('x86_64')
url="http://charlielee.uk/boats-animator"
_githuburl="https://github.com/charlielee/boats-animator"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libcups' 'libxrandr' 'nss' 'expat' 'libxdamage' 'libx11' 'at-spi2-core' 'dbus' 'gcc-libs' 'libdrm' 'hicolor-icon-theme' \
    'alsa-lib' 'libxkbcommon' 'gtk3' 'libxcomposite' 'glibc' 'libxfixes' 'mesa' 'cairo' 'pango' 'nspr' 'libxcb' 'libxext' 'glib2')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb")
sha256sums=('671e5743d742b154a6576257b58a92c013c9bed690d1787c73b433c89f9dbbab')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
}