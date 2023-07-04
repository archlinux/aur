# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer :  Biginoz 
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
pkgname=whalebird-bin
pkgver=5.0.7
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://whalebird.social/"
_githuburl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL3')
depends=('glibc' 'pango' 'libxkbcommon' 'libxdamage' 'wayland' 'glib2' 'expat' 'libcups' 'nspr' 'nss' 'mesa' 'libdrm' 'cairo' 'libx11' \
  'libxcb' 'gcc-libs' 'libxcomposite' 'dbus' 'at-spi2-core' 'hicolor-icon-theme' 'libxext' 'libxrandr' 'libxfixes' 'alsa-lib' 'gtk3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Whalebird-${pkgver}-linux-amd64.deb")
sha256sums=('cd7969a3cc7866e71602a97653f8ff9c9546ca7819886f42f5be5b0501a718c4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}