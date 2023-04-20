# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="rickrack-bin"
pkgver=2.7.26
pkgrel=1
pkgdesc="Generate harmonious colors freely.焰火十二卷(实时色彩工具箱)是一款免费且实用的色彩编辑器."
arch=('x86_64')
url="https://eigenmiao.com/rickrack/"
_githuburl="https://github.com/eigenmiao/Rickrack"
license=(GPL3)
options=(!strip)
providers=()
conflits=("${pkgname%-bin}")
depends=('unixodbc' 'gcc-libs' 'libxkbcommon' 'libxfixes' 'avahi' 'libxcomposite' 'qt5-sensors' 'libidn11' 'systemd-libs' \
    'qt5-x11extras' 'qt5-declarative' 'libepoxy' 'libthai' 'pixman' 'krb5' 'libgpg-error' 'libxext' 'qt5-websockets' \
    'cairo' 'orc' 'graphite' 'qt5-location' 'glibc' 'e2fsprogs' 'libdrm' 'freetype2' 'qt5-serialport' 'gst-plugins-base-libs' \
    'qt5-xmlpatterns' 'openssl-1.0' 'libgcrypt' 'expat' 'libxrender' 'glib2' 'bzip2' 'libpulse' 'mesa' 'qt5-wayland' \
    'hicolor-icon-theme' 'fontconfig' 'libxshmfence' 'libxinerama' 'libvorbis' 'gnutls' 'libdatrie' 'libxcb' 'libxi' \
    'pango' 'libxcursor' 'keyutils' 'libpng12' 'qt5-webchannel' 'zlib' 'qt5-multimedia' 'libtasn1' 'harfbuzz' 'libxdamage' \
    'gstreamer' 'gmp' 'libp11-kit' 'libsndfile' 'dbus' 'qt5-svg' 'gtk3' 'at-spi2-core' 'libasyncns' 'alsa-lib' \
    'qt5-base' 'libx11' 'libcups' 'libogg' 'xz' 'gdk-pixbuf2' 'libxrandr' 'libglvnd' 'wayland' 'libxkbcommon-x11')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Rickrack_v${pkgver}_en_linux_x86_64.deb")
sha256sums=('e777047a3962c5d823314fc3af7704aeef67bb04c2edef5067377e1826ae1b91')
  
package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
}