# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=promethium-bin
pkgver=6.1.6
pkgrel=2
pkgdesc="Extensible, fast, and innovative Electron based web browser with Material UI design elements and built-in AdBlock."
arch=('x86_64')
url="https://github.com/Alex313031/promethium"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nspr' 'alsa-lib' 'glib2' 'libx11' 'libxcb' 'libxkbcommon' 'libxcomposite' 'libxext' 'hicolor-icon-theme' 'gcc-libs' 'gtk3' \
    'libxdamage' 'libxfixes' 'dbus' 'expat' 'mesa' 'at-spi2-core' 'cairo' 'wayland' 'pango' 'libcups' 'libxrandr' 'nss' 'glibc' 'libdrm')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Promethium_${pkgver}_amd64.deb")
sha256sums=('74da657f5b07c32f91ca7fdac99af9f53f1f89b6b429364918f618f81bc26b27')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}