# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-lbr-calc
pkgver=1.0
pkgrel=3
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'SHIMODA Asami' and OpenSourceSoftwareChannel. This is made for cheering LibreOffice"
arch=('any')
url="https://oss-ch.info/lbr/"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/lbr/lbr_ubuntu_calc.tgz")
md5sums=('844cfb9446a71fb16f9bc554940f1e7b'
         '0db7f9a9732a00e925ccdd5d740b3cb2')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./usr/share/sounds/LBR_Calc "${pkgdir}/usr/share/sounds/lbr-calc"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
