# Maintainer: LeVraiKing <fabbroaugustin@gmail.com>

pkgname=altsendme-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="File transfert doesn't need to be complicated"
arch=('x86_64')
url="https://github.com/tonyantony300/alt-sendme"
license=('AGPL-3.0-only')
source=("alt-sendme::https://github.com/LeVraiKing/altsendme-bin/releases/download/v${pkgver}/alt-sendme"
        "alt-sendme.desktop::https://raw.githubusercontent.com/LeVraiKing/altsendme-bin/master/alt-sendme.desktop"
        "alt-sendme.png::https://raw.githubusercontent.com/LeVraiKing/altsendme-bin/master/alt-sendme.png")
sha256sums=('b0ebc11fc54b393e316c4e83796d7e3ab1b47aa99601ca355b793c0d912e4684'
            'SKIP'
            'e56868ca6cc967ec7c2260fc976c3172f19116843d598b54a28eb2a608131b27')

package() {
    install -Dm755 "${srcdir}/alt-sendme" "${pkgdir}/usr/bin/alt-sendme"
    install -Dm644 "${srcdir}/alt-sendme.desktop" "${pkgdir}/usr/share/applications/alt-sendme.desktop"
    install -Dm644 "${srcdir}/alt-sendme.png" "${pkgdir}/usr/share/pixmaps/alt-sendme.png"
}
