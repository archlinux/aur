#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=browservice
pkgver=0.9.6.2
pkgrel=1
pkgdesc='Browse the modern web on historical browsers'
url='https://github.com/ttalvitie/browservice'
license=('MIT')
arch=('x86_64')
options=(!strip)
depends=('wget' 'cmake' 'poco' 'pango' 'libjpeg-turbo' 'libxcb' 'libx11' 'python' 'xorg-server-xvfb' 'xorg-xauth' 'at-spi2-atk' 'alsa-lib' 'nss' 'libcups' 'libxcursor' 'libxss' 'libxcomposite' 'libxkbcommon' 'ttf-ms-fonts' 'gtkglext' 'fuse2' 'fuse3')
source=("https://github.com/ttalvitie/browservice/releases/download/v${pkgver}/browservice-v${pkgver}-x86_64.AppImage")
sha256sums=('f0614b4f173d4fbc704d6656087d2c0f894093e74ad03a7c728fa3c8a01dff23')

package() {
cd "${srcdir}"
install -Dm755 browservice-v${pkgver}-x86_64.AppImage "${pkgdir}/usr/bin/browservice"
echo "Be sure to run browservice --install-verdana for optimal GUI performance."
}
