# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oh-mymd-bin
_appname=ohmymd
pkgver=0.6.1
pkgrel=2
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_githuburl="https://github.com/1oopstudio/support.ohmymd.app"
license=(unknown)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('libxrandr' 'hicolor-icon-theme' 'dbus' 'libxcomposite' 'nss' 'libxkbcommon' 'libxdamage' 'alsa-lib' 'expat' 'libdrm' 'at-spi2-core' \
    'mesa' 'cairo' 'libxext' 'libxfixes' 'pango' 'gtk3' 'gcc-libs' 'nspr' 'libxcb' 'glibc' 'libx11' 'glib2' 'libcups' 'wayland')
source=("${pkgname%-bin}-${pkgver}.deb::https://oss.ohmymd.milchstrabe.com/patch/linux/deb/${_appname}_${pkgver}_amd64.deb")
sha256sums=('df6cd51ce12fdf9f262eb74d16b9441fb90141dc78a2e89757404fd544046abb')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}".
}