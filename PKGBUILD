# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
pkgver=1.36.4
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=("${pkgname%-desktop-bin}")
conflits=("${pkgname%-bin}-appimage" "${pkgname%-bin}")
depends=('nss' 'alsa-lib' 'at-spi2-core' 'gtk3' 'libxext' 'cairo' 'glibc' 'nspr' 'libxrandr' 'libx11' 'libcups' 'libxcb' 'mesa' \
    'libxcomposite' 'glib2' 'dbus' 'expat' 'pango' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'libxdamage' 'gcc-libs' 'libxkbcommon')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('87b1462c92f75ffeddc602810a43ace4e8b5bc9803a36b243f75f3b19654b4a4')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}