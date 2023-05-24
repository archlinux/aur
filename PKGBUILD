# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="revealed-bin"
pkgver=2.0.0alpha.14
_appver=alpha.14
pkgrel=1
pkgdesc="A platform and store for apps, games, and more!"
arch=('x86_64')
url="https://www.appsrevealed.com/"
_githuburl="https://github.com/BunnyStrike/revealed"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libcups' 'expat' 'libxcb' 'glib2' 'alsa-lib' 'gcc-libs' 'libxdamage' 'nss' 'gtk3' 'nspr' 'libxkbcommon' \
    'libxext' 'at-spi2-core' 'libxrandr' 'libdrm' 'dbus' 'pango' 'mesa' 'glibc' 'hicolor-icon-theme' 'zlib' 'cairo' \
    'libx11' 'libxfixes' 'libxcomposite')
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver%${_appver}}-${_appver}/Revealed.pacman")
sha256sums=('94d09ef43f255b319188e320f384865b691cba39d47306699ec5accd1b82c371')
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}