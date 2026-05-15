# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=proton-ge-launcher-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Add mimetype association for launching standalone games directly with Proton-GE in file manager"
arch=(any)
url="https://aur.archlinux.org/packages/proton-ge-launcher-desktop"
license=('MIT')
depends=(proton-ge-custom
         hicolor-icon-theme)
source=("proton-ge.desktop"
        "proton-ge.png")
sha256sums=('f2a7a853fa615b9ee1c3662ce12cb1f2f851a536259eb11bb11214bab5791cd2'
            '931597b1f045c880b3fc6afd589d975e6143aa422b9357328c154cf6e76ab234')

package() {
    install -Dm644 "${srcdir}/proton-ge.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/proton-ge.png"
    install -Dm644 "${srcdir}/proton-ge.desktop" "${pkgdir}/usr/share/applications/proton-ge.desktop"
}

