# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=netsend
pkgname="${_pkgname}-bin"
pkgver=2.0.5
pkgrel=1
pkgdesc="An intranet file transfer tool based on umijs + electron + javascript.一个基于 umijs + electron + javascript 构建的内网文件传输工具"
arch=('x86_64')
url="https://github.com/williamnie/netSend"
license=('GPL2')
conflicts=()
depends=(nss alsa-lib at-spi2-core gtk3 libxfixes dbus libxext cairo mesa glib2 libxcb hicolor-icon-theme expat \
    glibc nspr wayland libdrm pango libx11 gcc-libs libxkbcommon libxcomposite libxrandr libcups libxdamage)
options=()
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}.5/NetSend_${pkgver}_amd64.deb")
sha256sums=('88f7f7cfc21efbe66ab34b1283763c10b37bde802d2d53a329eed62d49779f0b')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}