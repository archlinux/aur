# Maintainer: orumin <dev@orum.in>

pkgname=sound-theme-lbr-writer
pkgver=1.0
pkgrel=3
pkgdesc="Sound theme for Linux desktop made by Japanimation voice actor 'TADOKORO Azusa' and OpenSourceSoftwareChannel. This is made for cheering LibreOffice"
arch=('any')
url="https:/oss-ch.info/lbr/"
license=('custom')
source=("LICENSE.txt"
        "https://oss-ch.info/lbr/lbr_ubuntu_writer.tgz")
md5sums=('844cfb9446a71fb16f9bc554940f1e7b'
         '9ffbf11da394d8e618d582fc7881f9b2')

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/share/sounds"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r ./usr/share/sounds/LBR_Writer "${pkgdir}/usr/share/sounds/lbr-writer"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
