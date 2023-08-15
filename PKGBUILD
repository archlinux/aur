# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alspotron-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Shows the egg lyrics of the track, playing on Spotify / YouTube Music"
arch=('x86_64')
url="https://github.com/organization/alspotron"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxrandr' 'at-spi2-core' 'libxkbcommon' 'pango' 'expat' 'java-runtime' 'dbus' 'alsa-lib' 'nss' 'glibc' 'nspr' \
    'libxdamage' 'cairo' 'libxcomposite' 'libcups' 'libxcb' 'gtk3' 'libdrm' 'libxext' 'hicolor-icon-theme' 'libxfixes' \
    'glib2' 'gcc-libs' 'libx11' 'mesa')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('192ee41e2dd55acbc808d3453d535c1cf86237c1f6f7c72a7ca1daa582d2f3b7')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}