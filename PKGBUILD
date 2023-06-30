# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vikunja-desktop-bin
pkgver=0.20.3
pkgrel=1
pkgdesc="The open-source, self-hostable to-do app.Organize everything, on all platforms."
arch=('x86_64')
url="https://vikunja.io/"
_githuburl="https://github.com/go-vikunja/desktop"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('mesa' 'libxrandr' 'pango' 'hicolor-icon-theme' 'nss' 'libxcb' 'libxdamage' 'at-spi2-core' 'libxcomposite' 'libxext' 'glibc' \
    'dbus' 'libxkbcommon' 'gcc-libs' 'libcups' 'libx11' 'expat' 'glib2' 'libxfixes' 'nspr' 'gtk3' 'libdrm' 'cairo' 'alsa-lib')
source=("${pkgname%-appimage}-${pkgver}.pacman::https://dl.vikunja.io/desktop/${pkgver}/Vikunja%20Desktop-${pkgver}.pacman")
sha256sums=('136c619777568c683e509ee5956d7acf6d51a02995ff0f9b006c6488363416a2')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}