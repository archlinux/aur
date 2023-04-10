# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=esearch-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=('alsa-lib' 'qt5-base' 'nss' 'nodejs' 'gtkmm3' 'at-spi2-core' 'libxcb' 'gdk-pixbuf2' 'cairo' 'libcups' 'libxdamage' 'libxrandr' \
    'glibmm' 'atkmm' 'pangomm' 'expat' 'libxtst' 'libxext' 'libxfixes' 'libxt' 'glibc' 'libxkbcommon' 'gcc-libs' 'libx11' 'libdrm'\
      'glib2' 'zlib' 'mesa' 'cairomm' 'hicolor-icon-theme' 'gtk3' 'dbus' 'harfbuzz' 'libsigc++' 'pango' 'nspr' 'libxcomposite' 'sh')
optdepends=()
provides=("xushengfeng")
conflicts=("${pkgname%-bin}-appimage")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/eSearch-${pkgver}-linux-amd64.deb")
sha256sums=('de9100181924babe41685151485628c1d25639f8a15805cd95242f2464a82269')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}