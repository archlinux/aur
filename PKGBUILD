# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=advanced-passgen-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Advanced Password Generator"
arch=('x86_64')
url="https://codedead.com/software/advanced-passgen"
_githuburl="https://github.com/CodeDead/Advanced-PassGen"
license=('GPL3')
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'gdk-pixbuf2' 'glib2' 'gcc-libs' 'openssl' 'cairo' 'webkit2gtk' 'glibc' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('baaf127575a6205ce121cf7bc3bb3f3cc45333c3e0d388e53b27638f45cca929')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}