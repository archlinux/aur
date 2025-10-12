# Maintainer: Mrinmoy <grx8x0mfy@mozmail.com>
pkgname=ulaa-bin
_pkgname=Ulaa-Browser
pkgver=2.36.1
pkgrel=2
epoch=
pkgdesc="Private, Secure & Fast Browsing"
arch=(x86_64)
url="https://ulaa.com"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(ulaa-browser-stable)
conflicts=(ulaa-browser ulaa-browser-bin)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${pkgname}-${pkgver}-${pkgrel}.deb::https://ulaa.zoho.com/release/linux/stable/${_pkgname}-v${pkgver}-amd64.deb)
noextract=()
sha256sums_x86_64=(10eae0b9dcbf35a6ccfe34f74bb146386a1ca9b585d5bddf80f3f0d0a5501027)
validpgpkeys=()

prepare() {
  tar -xvf data.tar.xz
}

package() {
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_24.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/ulaa-browser.png" 
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ulaa-browser.png"

    cp -ra ./opt ./usr ./etc "${pkgdir}"
}
