# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mogan-bin"
pkgver=1.1.3
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor"
arch=('x86_64')
url="https://mogan.app/"
_githuburl="https://github.com/XmacsLabs/mogan"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('qt5-svg' 'qt5-base' 'glibc' 'gcc-libs' 'gawk' 'hicolor-icon-theme' 'sqlite' 'sh' 'freetype2' 'zlib' 'libpng' 'libjpeg-turbo' 'perl' 'python' 'curl')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-ubuntu22.04.deb")
sha256sums=('8eeed3059313ca8df1096a004091f006fb4a5281c4c08e4d76cb535dd2e186d3')
 
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/include"
}