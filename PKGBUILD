# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastdownloader-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="A fast video/audio downloader in electron.js"
arch=('x86_64')
url="https://github.com/BERNARDO31P/FastDownloader"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('nss' 'mesa' 'libxcomposite' 'libxkbcommon' 'libxfixes' 'gtk3' 'libxdamage' 'expat' 'libdrm' 'libx11' 'hicolor-icon-theme' 'gcc-libs' \
    'dbus' 'glibc' 'at-spi2-core' 'nspr' 'libxcb' 'libxrandr' 'glib2' 'libxext' 'pango' 'libcups' 'cairo' 'alsa-lib')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman")
sha256sums=('2a16882d5278b2443c9d8340b2275c4829aad3956f80426b68f2cd5c4ae2fb32')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}