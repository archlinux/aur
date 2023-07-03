# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=graycrown-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple game launcher for games.Old Coal. Now revived with a new name!"
arch=('x86_64')
url="https://zeankundev.github.io/graycrown"
_githuburl="https://github.com/zeankundev/graycrown"
license=('GPL3')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "coal")
depends=('libxdamage' 'glib2' 'libxrandr' 'libxfixes' 'dbus' 'glibc' 'libdrm' 'mesa' 'nspr' 'libx11' 'libxkbcommon' 'nss' 'at-spi2-core' \
    'cairo' 'libcups' 'hicolor-icon-theme' 'alsa-lib' 'libxext' 'wayland' 'libxcb' 'expat' 'libxcomposite' 'gcc-libs' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8b752cf3803eceb1bdd8f09ab3f8c49801e3f169d0720b67ef0b5be628960c1a')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}