# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=advanced-passgen-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Advanced Password Generator"
arch=('x86_64')
url="https://codedead.com/software/advanced-passgen"
_githuburl="https://github.com/CodeDead/Advanced-PassGen"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
providers=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'gdk-pixbuf2' 'glib2' 'gcc-libs' 'openssl' 'cairo' 'webkit2gtk' 'glibc' 'gtk3')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('b3be50486052573a5e8e2a000d2e83089e2c4c9de78e4e203eda227d358370c3')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}