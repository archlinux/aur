# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whatsapp-for-linux-bin
_origname=com.github.eneshecan.WhatsAppForLinux
pkgver=1.6.3
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for Linux."
arch=('x86_64')
url="https://github.com/eneshecan/whatsapp-for-linux"
license=('GPL3')
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('gcc-libs' 'glib2' 'libcanberra' 'gtkmm3' 'libayatana-appindicator' 'atkmm' 'glibmm' 'libsigc++' 'gtk3' 'webkit2gtk' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('52245cc99e0772f53795a81ba8c5fd3d314f5c433ca6fd10bb4c106692d04f90')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
}