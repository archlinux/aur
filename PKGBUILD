# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="oh-mymd-bin"
_appname=ohmymd
pkgver=0.6.0
pkgrel=1
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_githuburl="https://github.com/1oopstudio/support.ohmymd.app"
license=(unknown)
options=(!strip)
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxrandr' 'hicolor-icon-theme' 'dbus' 'libxcomposite' 'nss' 'libxkbcommon' 'libxdamage' 'alsa-lib' 'expat' 'libdrm' 'at-spi2-core' \
    'mesa' 'cairo' 'libxext' 'libxfixes' 'pango' 'gtk3' 'gcc-libs' 'nspr' 'libxcb' 'glibc' 'libx11' 'glib2' 'libcups' 'wayland')
source=("${pkgname%-bin}-${pkgver}.deb::https://oss.ohmymd.milchstrabe.com/patch/linux/deb/${_appname}_${pkgver}_amd64.deb")
sha256sums=('0711d11ee183a7cf642f78c3bd4ce1db309031c0c5946f810c704566dcf89a51')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}