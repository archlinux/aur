# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revealed-bin
pkgver=2.0.0_alpha.15
pkgrel=2
pkgdesc="A platform and store for apps, games, and more!"
arch=('x86_64')
url="https://www.appsrevealed.com/"
_githuburl="https://github.com/BunnyStrike/revealed"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'expat' 'libxcb' 'glib2' 'alsa-lib' 'gcc-libs' 'libxdamage' 'nss' 'gtk3' 'nspr' 'libxkbcommon' \
    'libxext' 'at-spi2-core' 'libxrandr' 'libdrm' 'dbus' 'pango' 'mesa' 'glibc' 'hicolor-icon-theme' 'zlib' 'cairo' \
    'libx11' 'libxfixes' 'libxcomposite')
source=("${pkgname%-appimage}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver//_/-}/Revealed.pacman")
sha256sums=('64053a54fae6f9f4d40cb156ebf3dc5cf8fca6d8aaa1fff0e941d572048457f8')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}