# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=proton-cachyos-launcher-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Add mimetype association for launching standalone games directly with Proton-CachyOS in file manager"
arch=(any)
url="https://aur.archlinux.org/packages/proton-cachyos-launcher-desktop"
license=('MIT')
depends=(proton-cachyos-launcher
         hicolor-icon-theme)
source=("proton-cachyos.desktop"
        "proton-cachyos.png")
sha256sums=('38749940cf81d9c451f812232e362772011f02ced91c5b5dc076f1c0aea7bee6'
            '78af853f17517466c41e1dd89850c10df50ea1dbb601066bc4f811f5470d3be5')

package() {
    install -Dm644 "${srcdir}/proton-cachyos.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/proton-cachyos.png"
    install -Dm644 "${srcdir}/proton-cachyos.desktop" "${pkgdir}/usr/share/applications/proton-cachyos.desktop"
}

