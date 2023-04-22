# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="csbooks-bin"
pkgver=7.5.0
pkgrel=4
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader"
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('unknown')
conflicts=("${pkgname%-bin}-appimage" "${pkgname%-bin}")
depends=('alsa-lib' 'gtk3' 'nss' 'at-spi2-core' 'libdrm' 'glib2' 'dbus' 'gdk-pixbuf2' 'libxrandr' \
    'libxdamage' 'hicolor-icon-theme' 'libxshmfence' 'gcc-libs' 'libxcomposite' 'libxcb' 'cairo' \
    'libxext' 'mesa' 'expat' 'libcups' 'nspr' 'libx11' 'libxfixes' 'pango' 'glibc' 'libxkbcommon')
source=("${pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/latest/csBooks-${pkgver}.pacman")
sha256sums=('b1dfc2d6b137580b7bba60da5d97886369170f6b38b3154ad919847b9eca7afc'
            '9e45f7627b17b6f7dbfa93c96c98c88e90405629835ffaf3c3acab2243f2ef64')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}