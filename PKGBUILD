# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linked-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Daily journaling without distraction. An easy, distraction-free way to record your thoughts, declutter your mind and keep the things you want to remember. "
arch=('x86_64')
url="https://uselinked.com/"
_githuburl="https://github.com/lostdesign/linked"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libx11' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'gdk-pixbuf2' 'pango' 'libdrm' 'libxfixes' 'dbus' 'libxext' 'mesa' 'libxcb' \
    'glib2' 'at-spi2-core' 'libxkbcommon' 'libxrandr' 'gtk3' 'nss' 'nspr' 'expat' 'cairo' 'libcups' 'libxdamage' 'alsa-lib' 'libxcomposite' )
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('e4514dcc45e012cbf7d01e94879013e6e6c71f67a5f4927185c60b1380f0fee9')

package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}