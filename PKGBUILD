# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whatsapp-for-linux-bin
_origname=com.github.eneshecan.WhatsAppForLinux
pkgver=1.6.4
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for Linux."
arch=('x86_64')
url="https://github.com/eneshecan/whatsapp-for-linux"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'glib2' 'libcanberra' 'gtkmm3' 'libayatana-appindicator' 'atkmm' 'glibmm' 'libsigc++' 'gtk3' 'webkit2gtk' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('f8c0dc44cd2122962325211238489089c7024b6bc75391254701af6591295d89')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
}