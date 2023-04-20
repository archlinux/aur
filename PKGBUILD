# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="oh-mymd-bin"
_appname=ohmymd
pkgver=0.5.0
pkgrel=1
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_githuburl="https://github.com/1oopstudio/support.ohmymd.app"
license=(unknown)
options=(!strip)
providers=()
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxrandr' 'hicolor-icon-theme' 'dbus' 'libxcomposite' 'nss' 'libxkbcommon' 'libxdamage' 'alsa-lib' 'expat' 'libdrm' 'at-spi2-core' \
    'mesa' 'cairo' 'libxext' 'libxfixes' 'pango' 'gtk3' 'gcc-libs' 'nspr' 'libxcb' 'glibc' 'libx11' 'glib2' 'libcups' 'wayland')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('81fe0489aa1fab990521ff47cb51bc86fb4ba20ec9abcb76de81ea959c4fae0f')
 
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}