# Maintainer: Juwan Hwang <juwan.hwang at proton dot me>
pkgname=zephyr-clash-bin
_pkgname=zephyr
pkgver=2.5.0
pkgrel=2
pkgdesc="A modern Mihomo GUI client"
arch=('x86_64')
url="https://github.com/Juwan-Hwang/Zephyr"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('zephyr-clash')
conflicts=('zephyr-clash')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://github.com/Juwan-Hwang/Zephyr/releases/download/v${pkgver}/Zephyr_${pkgver}_linux-x86_64-full.deb")
sha256sums_x86_64=('5f103f38a9aac9265a8d7cab5290e2fbc596f7a873663abad3c76619ea47d88c')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
