# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ahmyth-bin
pkgver=1.0beta.4
_pkgver=beta.4
pkgrel=2
pkgdesc="Cross-Platform Android Remote Administration Tool"
arch=(x86_64)
url="https://github.com/Morsmalleo/AhMyth"
license=('GPL3')
depends=('nss' 'python-requests' 'gcc-libs' 'libdrm' 'expat' 'pango' 'at-spi2-core' 'mesa' 'glib2' 'glibc' 'libxext' 'libxfixes' 'gtk3' \
    'libx11' 'dbus' 'hicolor-icon-theme' 'libxdamage' 'gdk-pixbuf2' 'libxrandr' 'libcups' 'alsa-lib' 'java-runtime' 'libxcb' 'nspr' \
    'python' 'libxcomposite' 'cairo' 'libxkbcommon')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver%${_pkgver}}-${_pkgver}/AhMyth-Setup_amd64-Linux.deb")
sha256sums=('b98abfefb1e1ff402b3a9b561c081008e314ff8c3f072c10d9734725a55c06ab')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}