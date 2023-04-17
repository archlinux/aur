# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
pkgver=1.36.2
pkgrel=2
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=("${pkgname%-desktop-bin}")
conflits=("${pkgname%-bin}-appimage" "${pkgname%-bin}-git")
depends=(nss alsa-lib at-spi2-core gtk3 libxext cairo glibc nspr libxrandr libx11 libcups libxcb \
    libxcomposite glib2 dbus expat pango libdrm hicolor-icon-theme libxfixes libxdamage gcc-libs mesa libxkbcommon)
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('60ac076e20019cc9c078662b87cd6b3541dec6085fb90a7eba7098e6ca15b92d')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}