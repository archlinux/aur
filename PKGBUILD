# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alspotron-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Shows the egg lyrics of the track, playing on Spotify / YouTube Music"
arch=('x86_64')
url="https://github.com/organization/alspotron"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxrandr' 'at-spi2-core' 'libxkbcommon' 'pango' 'expat' 'java-runtime' 'dbus' 'alsa-lib' 'nss' 'glibc' 'nspr' \
    'libxdamage' 'cairo' 'libxcomposite' 'libcups' 'libxcb' 'gtk3' 'libdrm' 'libxext' 'hicolor-icon-theme' 'libxfixes' \
    'glib2' 'gcc-libs' 'libx11' 'mesa')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('3da79a9904d62ed49b198297062e5dfa94ef7cf1d68e47c7d9d3d7cb86944e20')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}