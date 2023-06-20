# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="deltachat-desktop-bin"
pkgver=1.38.0
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
_downloadurl="https://download.delta.chat/desktop"
license=('GPL3')
provides=("${pkgname%-desktop-bin}")
conflits=("${pkgname%-bin}-appimage" "${pkgname%-bin}")
depends=('nss' 'alsa-lib' 'at-spi2-core' 'gtk3' 'libxext' 'cairo' 'glibc' 'nspr' 'libxrandr' 'libx11' 'libcups' 'libxcb' 'mesa' \
    'libxcomposite' 'glib2' 'dbus' 'expat' 'pango' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'libxdamage' 'gcc-libs' 'libxkbcommon')
source=("${pkgname%-bin}-${pkgver}.pacman::${_downloadurl}/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('f128b4529f799f78277950744c9a17fe6dd58367c45f5ab78b2c477763767f37')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}