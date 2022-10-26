pkgname=kyocera-ecosys-m552x-p502x
pkgver=8.1602
pkgrel=1
pkgdesc="PPD file for Kyocera ECOSYS M5521cdn/M5521cdw/M5526cdn/M5526cdw/P5021cdn/P5021cdw/P5026cdn/P5026cdw"
arch=("any")
url="https://www.kyoceradocumentsolutions.de/index/serviceworld/downloadcenter.false.driver.ECOSYSM5521CDN._.EN.html"
license=('other')
depends=('cups')
conflicts=('kyocera-ecosys-p5021cdw')

source=('Kyocera ECOSYS M5521cdn.PPD'
        'Kyocera ECOSYS M5521cdw.PPD'
        'Kyocera ECOSYS M5526cdn.PPD'
        'Kyocera ECOSYS M5526cdw.PPD'
        'Kyocera ECOSYS P5021cdn.PPD'
        'Kyocera ECOSYS P5021cdw.PPD'
        'Kyocera ECOSYS P5026cdn.PPD'
        'Kyocera ECOSYS P5026cdw.PPD')

sha256sums=('5866300b047028d16bcbb8e0dbb907256709d61430d58f38369b2308aca6b3a1'
            '5da4bee9e233b0e2e5c6d802bc0cc243335108a918f5aa1c49d30da807ef8806'
            'a8a5bd2e6beaf8be8a09fe4fa85b0fe43943a57f7f915d83d2d906794d77d85e'
            '9cb0bd51082919f9980a076d6d324bf6ab7aefdd2be735d672268458315a34af'
            'fd43692c231a7016ecbbe73981c76cb0a35befe109b9aedbb6e4fe821304e652'
            '340e9c420432647737e9ea1c831699fc80d02ccac94f20fa361604d80698845a'
            '04a8f45fd3fe81a235993e83fa30ec0dd71b7d8045e208d82b5b9a77c7d77779'
            'c9cebca4a5cd243c52806d79154f4e04fcd831d9e2d95b96daafae213aa00970')

package () {
    cd ${srcdir}

    install -d -m755 ${pkgdir}/usr/share/ppd

    install -D -m644 "Kyocera ECOSYS M5521cdn.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS M5521cdn.PPD"
    install -D -m644 "Kyocera ECOSYS M5521cdw.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS M5521cdw.PPD"
    install -D -m644 "Kyocera ECOSYS M5526cdn.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS M5526cdn.PPD"
    install -D -m644 "Kyocera ECOSYS M5526cdw.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS M5526cdw.PPD"
    install -D -m644 "Kyocera ECOSYS P5021cdn.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P5021cdn.PPD"
    install -D -m644 "Kyocera ECOSYS P5021cdw.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P5021cdw.PPD"
    install -D -m644 "Kyocera ECOSYS P5026cdn.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P5026cdn.PPD"
    install -D -m644 "Kyocera ECOSYS P5026cdw.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P5026cdw.PPD"
}
