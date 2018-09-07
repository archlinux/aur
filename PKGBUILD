# Maintainer: Baron Hou <houbaron@gmail.com>
pkgname=picgo-appimage
pkgver=1.6.2
pkgrel=1

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("picgo-${pkgver}-${arch}.AppImage")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/picgo-${pkgver}-${arch}.AppImage"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    '9dc232e25855b05de43332e795aa141652dd0bf3ced2f9948636c46a2822aed2'
    '6cfaad3bb0ecfa6fc44645de29a17aeb1d7492c3b267ac2f87006205b2baec8c'
    '345d8c118aa8fdc84c1db8c37842f90f68333ca33e8c1b249abbbd58fde1f1a9'
)

package() {
    install -Dc picgo-${pkgver}-${arch}.AppImage ${pkgdir}/opt/appimages/picgo.AppImage
    install -Dc picgo.desktop                    ${pkgdir}/usr/share/applications/picgo.desktop
    install -Dc picgo.png                        ${pkgdir}/usr/share/icons/hicolor/256x256/apps/picgo.png
}