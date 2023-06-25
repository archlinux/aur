# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="web-os-dev-manager-bin"
pkgver=1.11.16
pkgrel=1
pkgdesc="Device/DevMode Manager for webOS TV"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'pango' 'cairo' 'libsoup' 'gdk-pixbuf2' 'webkit2gtk' 'gcc-libs' 'glib2' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('e0462e28ec837c9c03966fc14819ee730c9815347ed831b76b9894a552efbb27')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}