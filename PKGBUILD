# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="rickrack-bin"
pkgver=2.8.27
pkgrel=1
pkgdesc="Generate harmonious colors freely.焰火十二卷(实时色彩工具箱)是一款免费且实用的色彩编辑器."
arch=('x86_64')
url="https://eigenmiao.com/rickrack/"
_githuburl="https://github.com/eigenmiao/Rickrack"
license=("GPL3")
options=(!strip)
providers=()
conflits=("${pkgname%-bin}")
depends=('pixman' 'cairo' 'alsa-lib' 'libpulse' 'qt5-svg' 'gdk-pixbuf2' 'freetype2' 'glibc' 'systemd-libs' 'libxkbcommon' 'libxrender' 'xz' \
    'gst-plugins-base-libs' 'qt5-x11extras' 'libdrm' 'qt5-wayland' 'qt5-webchannel' 'gtk3' 'at-spi2-core' 'pango' 'hicolor-icon-theme' 'libtasn1' \
    'libxcomposite' 'gstreamer' 'krb5' 'qt5-websockets' 'fontconfig' 'unixodbc' 'gnutls' 'expat' 'libxcb' 'qt5-multimedia' 'qt5-location' 'qt5-base' \
    'qt5-sensors' 'libglvnd' 'graphite' 'gcc-libs' 'libxkbcommon-x11' 'qt5-declarative' 'libx11' 'avahi' 'gmp' 'libcups' 'libp11-kit' 'libgcrypt' \
    'glib2' 'e2fsprogs' 'libxext' 'harfbuzz' 'libidn11' 'dbus' 'wayland' 'keyutils' 'libthai' 'zlib' 'libgpg-error' 'libdatrie')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Rickrack_v${pkgver}_en_linux_x86_64.deb")
sha256sums=('147b44b4f41d5d585eed047b3b25a5e18b4b8b860232ee701d8bfc181bb4c490')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}