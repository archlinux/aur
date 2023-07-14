# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=implay-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Desktop media player built on top of mpv and imgui"
arch=('x86_64')
url="https://tsl0922.github.io/ImPlay"
_githuburl="https://github.com/tsl0922/ImPlay"
license=('GPL2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('gtk3' 'gcc-libs' 'glib2' 'freetype2' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/ImPlay-${pkgver}-Linux.deb")
sha256sums=('4eb6307e15998d44875b472e94b4d09321f05fdb86cc7e59cfed93c0981feab5')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}