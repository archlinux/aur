# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=micropad
pkgver=4.5.1
pkgrel=3
pkgdesc="A powerful note-taking app that helps you organise + take notes without restrictions."
arch=('x86_64')
url="https://getmicropad.com"
license=('MPL2')
source=(
    "https://github.com/MicroPad/MicroPad-Electron/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman"
)
sha256sums=('702bb7b54860d2997c469be4ca8c56ca0397d48907cfde230ef6a0cd12962fe4')
install="micropad.install"

package() {
    mv opt "${pkgdir}/opt"
    mv usr "${pkgdir}/usr"
}
