# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="droppoint-bin"
pkgver=1.2.1
pkgrel=3
pkgdesc="Make drag-and-drop easier using DropPoint. Drag content without having to open side-by-side windows"
arch=('x86_64')
url="https://droppoint.netlify.app/"
_githuburl="https://github.com/GameGodS3/DropPoint"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('nss' 'at-spi2-core' 'alsa-lib' 'gtk3' 'cairo' 'libxkbcommon' 'libxext' 'libcups' 'libxfixes' 'libxcb' 'gcc-libs' 'mesa' 'pango' 'libdrm' \
    'libx11' 'expat' 'glib2' 'gdk-pixbuf2' 'glibc' 'nspr' 'libxrandr' 'libxshmfence' 'libxdamage' 'hicolor-icon-theme' 'libxcomposite' 'dbus')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('b272d4415363eb33c54a6bec11aff870c51a1af4cf736ee76190bd4bd71ca5f4')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}