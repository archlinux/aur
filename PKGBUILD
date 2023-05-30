# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=horanghill-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Simple 3D Editor"
arch=('x86_64')
url="http://horanghill.great-site.net/"
_githuburl="https://github.com/HorangStudios/Editor"
license=('AGPL3')
options=(!strip)
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libglvnd' 'hicolor-icon-theme' 'nspr' 'libxrender' 'dbus' 'gcc-libs' 'glib2' 'libxtst' 'pango' 'libxdamage' 'libxss' 'libxcomposite' \
    'libxcursor' 'cairo' 'nss' 'alsa-lib' 'libxrandr' 'gdk-pixbuf2' 'libx11' 'libxi' 'at-spi2-core' 'glibc' 'expat' 'libxcb' 'gtk3' 'libcups' \
    'util-linux-libs' 'libxfixes' 'libxext')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('5229839954c81448671cca0f9e7202325084fdfd5a78d57fc599043acd8d3064')
     
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
}