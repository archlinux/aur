# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="weektodo-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="WeekToDo is a Free and Open Source Weekly Planner. Stop prioritizing what's on your schedule and start scheduling your priorities."
arch=("x86_64")
url="https://weektodo.me/"
_githuburl="https://github.com/manuelernestog/weektodo"
license=(GPL3)
depends=('nss' 'gtk3' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'expat' 'libxrandr' 'gcc-libs' 'libxkbcommon' 'nspr' 'libxcb' 'glib2' \
    'cairo' 'libx11' 'libxext' 'libxdamage' 'mesa' 'pango' 'hicolor-icon-theme' 'libdrm' 'libcups' 'libxcomposite' 'glibc' 'dbus')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/WeekToDo-${pkgver}.pacman")
sha256sums=('12f77013d6de60e71d041cc79f7d226881fafc88876bbf2de16f672b02d96895')
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}