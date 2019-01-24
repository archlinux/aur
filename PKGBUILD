# Maintainer: Baron Hou <houbaron@gmail.com>
pkgname=picgo-appimage
pkgver=2.0.2
pkgrel=1

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("picgo-${pkgver}-${arch}.AppImage")
options=("!strip")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/picgo-${pkgver}-${arch}.AppImage"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    'ddc9301e92e0c72d5ea9af455904a09f87181362443ec064202e35aadf959927'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "picgo-${pkgver}-${arch}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
