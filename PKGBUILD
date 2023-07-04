# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sofia Lima <me [at] dzshn [dot] xyz>
pkgname=vencord-desktop-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://github.com/Vencord/Desktop"
license=('GPL3')
depends=('libxkbcommon' 'libx11' 'nss' 'libcups' 'libxrandr' 'libxext' 'libxfixes' 'nspr' 'cairo' 'alsa-lib' 'dbus' 'libdrm' 'pango' \
  'libxcb' 'glibc' 'at-spi2-core' 'libxdamage' 'glib2' 'expat' 'gcc-libs' 'libxcomposite' 'mesa' 'hicolor-icon-theme' 'gtk3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/VencordDesktop_${pkgver}_amd64.deb")
sha256sums=('92b3bf4f20ff5b17e48591ff6bf48bf294eaa13438ca2c06afcfff2c82c825c0')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}