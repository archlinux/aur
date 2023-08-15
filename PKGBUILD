# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname=kalidoface-bin
pkgver=0.1.0
pkgrel=4
pkgdesc="A Vtuber web app powered by the latest and great in motion capture tech from MediaPipe."
arch=('x86_64')
url="https://lab.kalidoface.com/"
_githuburl="https://github.com/yeemachine/kalidoface"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'libcups' 'nss' 'cairo' 'nodejs' 'glibc' 'expat' 'libxkbcommon' 'libdrm' 'libxfixes' 'libxcb' 'pango' 'libxcomposite' \
    'at-spi2-core' 'dbus' 'alsa-lib' 'nspr' 'gtk3' 'glib2' 'libx11' 'hicolor-icon-theme' 'libxrandr' 'libxext' 'libxdamage'  'mesa')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('effd121646ac6fdcbf65a18c08ac621f42bd59d2719003b53524fd67a941310e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}