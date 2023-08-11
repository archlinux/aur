# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-utils-bin
pkgver=3.3.0
pkgrel=2
pkgdesc="Electron Utils for every day usage as a dev."
arch=('x86_64')
url='https://github.com/SamTV12345/DevRustPilot'
license=('unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libsoup' 'gdk-pixbuf2' 'gcc-libs' 'webkit2gtk' 'pango' 'openssl-1.1' 'cairo' 'gtk3' 'glib2' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_0.0.0_amd64.deb")
sha256sums=('293213097856719ed5265a6d29783748c0da844b063eed0ab7314767e063e349')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}