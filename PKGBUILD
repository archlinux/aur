# Maintainer: sunerpy <nkuzhangshn@gmail.com>
pkgname=picgo-appimage-beta
pkgver=2.3.0
_betaver=beta.4
pkgrel=4

pkgdesc="A simple & beautiful tool for pictures uploading built by vue-cli-electron-builder"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
changelog=
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}-${_betaver}/PicGo-${pkgver}-${_betaver}.AppImage"
    "picgo.png"
    "picgo.desktop"
)
noextract=("PicGo-${pkgver}-${_betaver}.Appimage")
options=("!strip")
sha256sums=(
    "7e76e9b2940bbd08106e7fff626a643b17fd17c403e542c8fdb530e8c2efcde9"
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "PicGo-${pkgver}-${_betaver}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
