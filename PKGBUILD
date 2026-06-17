# Maintainer: Juwan Hwang <juwan.hwang at proton dot me>
pkgname=zephyr-clash-bin
_pkgname=zephyr
pkgver=2.3.9
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
sha256sums_x86_64=('7a40253b55a2a1bd62f289ec0651670764839801aeefc4358ecd2e24bec3caf7')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
