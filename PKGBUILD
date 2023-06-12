# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastdownloader-bin
pkgver=0.5.8
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
sha256sums=('f665254f05dfc4f90d6badf14f3f523b9cbe8ece68d12b8340a7129915369453')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}