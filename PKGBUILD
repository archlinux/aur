# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shadowsocks-electron-bin"
pkgver=1.2.3
pkgrel=1
pkgdesc="Shadowsocks GUI application made for Ubuntu/Mac/Win users and powered by Electron."
arch=('x86_64')
url="https://github.com/nojsja/shadowsocks-electron"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-electron-bin}")
depends=('libxkbcommon' 'gcc-libs' 'libxrandr' 'expat' 'libxdamage' 'mesa' 'libxext' 'gtk3' 'nspr' 'dbus' 'libxcb' \
    'hicolor-icon-theme' 'libx11' 'libdrm' 'cairo' 'glibc' 'libcups' 'glib2' 'alsa-lib' 'gdk-pixbuf2' 'libxcomposite' \
    'pango' 'nss' 'at-spi2-core' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/shadowsocks-electron_${pkgver}_amd64.deb")
sha256sums=('f66c31e67b046c156a841219446f89c571daebc22458b456451c59f400be1c36')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}