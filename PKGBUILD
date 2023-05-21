# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="revealed-bin"
pkgver=2.0.0alpha.13
_appver=2.0.0-alpha.13
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
source=("${pkgname%-appimage}-${pkgver}.pacman::${_githuburl}/releases/download/v${_appver}/Revealed.pacman")
sha256sums=('8320c907a182bce73f0049d22ae450d86e3614c7e02c1251c7b9b7ee83d6d7a2')
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}