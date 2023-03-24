# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=esearch
pkgname="${_pkgname}-bin"
pkgver=1.10.0
pkgrel=1
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=(alsa-lib qt5-base nss nodejs gtkmm3 at-spi2-core libxcb gdk-pixbuf2 cairo libcups libxdamage libxrandr glibmm atkmm pangomm expat libxtst libxext \
    libxfixes libxt glibc glib2 zlib mesa cairomm hicolor-icon-theme gtk3 dbus harfbuzz libxkbcommon gcc-libs libsigc++ pango libx11 nspr libxcomposite libdrm)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}-appimage")
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}-beta.5/eSearch-${pkgver}-beta.5-linux-amd64.deb")
sha256sums=('18bdef3dc3135f92c33a3061fb78b14a3e0f27b9b2f072730c5e9a3d3ed274d3')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}