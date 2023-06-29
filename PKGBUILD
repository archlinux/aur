# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linked-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Daily journaling without distraction. An easy, distraction-free way to record your thoughts, declutter your mind and keep the things you want to remember. "
arch=('x86_64')
url="https://uselinked.com/"
_githuburl="https://github.com/lostdesign/linked"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libx11' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'gdk-pixbuf2' 'pango' 'libdrm' 'libxfixes' 'dbus' 'libxext' 'mesa' 'libxcb' \
    'glib2' 'at-spi2-core' 'libxkbcommon' 'libxrandr' 'gtk3' 'nss' 'nspr' 'expat' 'cairo' 'libcups' 'libxdamage' 'alsa-lib' 'libxcomposite' )
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('44fc87edf617d445a014ddc637ae547371f218f803b2558d0e1014d3879483cf')

package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}