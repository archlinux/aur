# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=web-os-dev-manager-bin
pkgver=1.11.18
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'pango' 'cairo' 'libsoup' 'gdk-pixbuf2' 'webkit2gtk' 'gcc-libs' 'glib2' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('11837e75693e599e0a2ee4a4c40462d71e6c72f311d3e3d7069887d8a32bc16d')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}