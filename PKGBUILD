# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="thedesk-bin"
pkgver=24.1.2
pkgrel=1
pkgdesc="Mastodon Client for PC."
arch=("x86_64")
url="https://thedesk.top/"
_githuburl="https://github.com/cutls/TheDesk"
license=('GPL3')
depends=('libxdamage' 'hicolor-icon-theme' 'libdrm' 'glibc' 'nspr' 'libxrandr' 'nss' 'alsa-lib' 'libxext' 'libxcb' 'cairo' \
    'at-spi2-core' 'libcups' 'pango' 'glib2' 'libxfixes' 'libxkbcommon' 'gcc-libs' 'gtk3' 'mesa' 'libx11' 'expat' 'dbus' 'zsh' 'libxcomposite')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('d04bc9eb4c93462dd1d2096023c977afb9b147be8c703035c79685e964036dd5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}