# Maintainer: shamhunter <nkuzhangshn@gmail.com>
pkgname=picgo-appimage-beta
pkgver=2.3.0
_betaver=beta.3
pkgrel=1

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
    "87af7f01462e03dc8ef84241a282cb0b236a2dba8f0e0a8fe7df5ab6a28a6eb0"
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "PicGo-${pkgver}-${_betaver}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
