# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="epherome-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="Powerful Minecraft Launcher"
arch=('x86_64')
license=('GPL3')
conflicts=("${pkgname%-bin}")
url="https://epherome.com/"
_githuburl="https://github.com/ResetPower/Epherome"
depends=('alsa-lib' 'mesa' 'hicolor-icon-theme' 'libxcb' 'libcups' 'gtk3' 'dbus' 'libxdamage' 'gcc-libs' 'nspr' 'nss' \
    'libxext' 'libx11' 'libxkbcommon' 'cairo' 'libxcomposite' 'libdrm' 'libxrandr' 'expat' 'glibc' 'glib2' 'pango' 'at-spi2-core' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Epherome-${pkgver}.deb")
sha256sums=('7dc740a18e73eb11aaa1ef7dad8342857ab043fb81112dac36129a1f895e49a5')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}