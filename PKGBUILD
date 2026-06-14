# Maintainer: Juwan Hwang <juwan.hwang at proton dot me>
pkgname=zephyr-clash-bin
_pkgname=zephyr
pkgver=2.3.8
pkgrel=1
pkgdesc="A modern Mihomo GUI client"
arch=('x86_64')
url="https://github.com/Juwan-Hwang/Zephyr"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('zephyr-clash')
conflicts=('zephyr-clash')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://github.com/Juwan-Hwang/Zephyr/releases/download/v${pkgver}/Zephyr_${pkgver}_amd64-full.deb")
sha256sums_x86_64=('ffaab253d2cfa7f321c1ea9f280810bff1d2ba9522340a0ce7edc39d4648066c')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
