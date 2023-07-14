# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gpt-anywhere-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="Use GPT anywhere with just one shortcut."
arch=('x86_64')
url="http://jinay.dev/gpt-anywhere/"
_githuburl="https://github.com/JinayJain/gpt-anywhere"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('glibc' 'hicolor-icon-theme' 'webkit2gtk' 'cairo' 'glib2' 'gdk-pixbuf2' 'gcc-libs' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('a589d4714b03d41b34ce8163ad7472b423b07ecb193c00187753adb125950cef')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}
