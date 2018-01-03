# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-lbr-impress
pkgver=1.0
pkgrel=2
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'TANGE Sakura' and OpenSourceSoftwareChannel. This is made for cheering LibreOffice"
arch=('any')
url="https://oss-ch.info/lbr/"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/lbr/lbr_ubuntu_impress.tgz")
md5sums=('844cfb9446a71fb16f9bc554940f1e7b'
         '6e9c429fbd3c822b221aad1606f82854')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./usr/share/sounds/LBR_Impress "${pkgdir}/usr/share/sounds/lbr-impress"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
