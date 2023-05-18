# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="revealed-bin"
pkgver=2.0.0alpha.9
_appver=2.0.0-alpha.9
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
sha256sums=('96e158e6bef4894b6b1d149ebff4b19c6c2f9e292a1ae1a31fbd5690d644bf36')
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}