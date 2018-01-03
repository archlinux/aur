# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-lbr-draw
pkgver=1.0
pkgrel=3
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'MATSUI Eriko' and OpenSourceSoftwareChannel. This is made for cheering LibreOffice"
arch=('any')
url="https://oss-ch.info/lbr/"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/lbr/lbr_ubuntu_draw.tgz")
md5sums=('844cfb9446a71fb16f9bc554940f1e7b'
         'e490138e2eb9eb72583e3beefbff3534')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./usr/share/sounds/LBR_Draw "${pkgdir}/usr/share/sounds/lbr-draw"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
