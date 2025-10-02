# Maintainer: Mrinmoy <grx8x0mfy@mozmail.com>
pkgname=ulaa-bin
_pkgname=ulaa-browser
pkgver=2.36.0
pkgrel=1
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
conflicts=(ulaa-browser-stable)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}.deb::https://ulaa.zoho.com/release/linux/stable/${_pkgname}-v${pkgver}-amd64.deb)
noextract=()
sha256sums_x86_64=(1cb083f2794642ee1f1052f84de24d35d0e4bc722e3f8ed0b7ff09848dd40424)
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
