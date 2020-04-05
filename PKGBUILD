# Maintainer: Baron Hou <houbaron@gmail.com>
pkgname=picgo-appimage
pkgver=2.2.2
pkgrel=1

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("PicGo-${pkgver}.AppImage")
options=("!strip")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/PicGo-${pkgver}.AppImage"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    '7fcfd94cbc1209d76387671b92693c815cfb8fac2132e0ca37e3a55aeb932133'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "PicGo-${pkgver}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
