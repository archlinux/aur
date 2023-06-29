# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="deltachat-desktop-bin"
pkgver=1.38.1
pkgrel=2
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://delta.chat/"
_githuburl="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=("${pkgname%-desktop-bin}")
conflits=("${pkgname%-bin}-appimage" "${pkgname%-bin}")
depends=('nss' 'alsa-lib' 'at-spi2-core' 'gtk3' 'libxext' 'cairo' 'glibc' 'nspr' 'libxrandr' 'libx11' 'libcups' 'libxcb' 'mesa' \
    'libxcomposite' 'glib2' 'dbus' 'expat' 'pango' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'libxdamage' 'gcc-libs' 'libxkbcommon')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('b034f10573374622809099dc489467ab49ee32f22788f2f505674d3617418f13')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}