# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="weektodo-bin"
pkgver=2.0.0
pkgrel=3
pkgdesc="WeekToDo is a Free and Open Source Weekly Planner. Stop prioritizing what's on your schedule and start scheduling your priorities."
arch=("x86_64")
url="https://weektodo.me/"
_githuburl="https://github.com/manuelernestog/weektodo"
license=(GPL3)
depends=('nss' 'gtk3' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'expat' 'libxrandr' 'gcc-libs' 'gdk-pixbuf2' 'libxkbcommon' \
    'cairo' 'libx11' 'libxext' 'libxdamage' 'mesa' 'pango' 'hicolor-icon-theme' 'libdrm' 'libcups' 'libxcomposite' 'glibc' \
    'nspr' 'libxcb' 'glib2' 'dbus')
options=()
optdepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/WeekToDo-${pkgver}.pacman")
sha256sums=('8e9197b515f1bf55d169562d1c1e1b1c711cd0cecc11c3185e4ac8312b9f228f')
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}