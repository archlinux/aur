# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="web-os-dev-manager-bin"
pkgver=1.11.17
pkgrel=2
pkgdesc="Device/DevMode Manager for webOS TV"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'pango' 'cairo' 'libsoup' 'gdk-pixbuf2' 'webkit2gtk' 'gcc-libs' 'glib2' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('692b5b57ad5f8296fed48b1c4b5a1649ae96e6063546c45a73682e7333c40419')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}