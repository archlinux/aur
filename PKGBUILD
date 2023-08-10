# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=authme-bin
pkgver=4.1.0
pkgrel=2
pkgdesc="Simple cross-platform two-factor (2FA) authenticator app for desktop."
arch=('x86_64')
url="https://authme.levminer.com/"
_githuburl="https://github.com/Levminer/authme"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'glibc' 'gdk-pixbuf2' 'gtk3' 'webkit2gtk' 'cairo' 'openssl' 'libsoup' 'gcc-libs' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb")
sha256sums=('43cfff3d56d1fa42ba61e916429d94d8e36affcfff0d37b381e4832d26af1f28')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}