# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sengi-bin"
pkgver=1.2.0
pkgrel=3
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('nss' 'at-spi2-core' 'alsa-lib' 'gtk3' 'libxtst' 'libxrender' 'nspr' 'mesa' 'libxcursor' \
    'pango' 'gcc-libs' 'libxext' 'hicolor-icon-theme' 'libxrandr' 'libxcomposite' 'libxfixes' 'libxcb' \
    'libcups' 'gdk-pixbuf2' 'expat' 'glib2' 'libxdamage' 'libx11' 'glibc' 'libdrm' 'libxi' 'dbus' 'cairo')
source=("${pkgname%-bin}${pkgver}.deb::${url}/releases/download/${pkgver}/Sengi-${pkgver}-linux.deb")
sha256sums=('47ed30e21f70cf199f6ef433f7fb3a620ba7c27b920cb7c7fa0c74db19829062')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}