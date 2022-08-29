# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap-variable
pkgver=3.001
pkgrel=2
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('OFL')
_commit='a7ae77c9d7dc2020feaa6d4a8606e2235450b8b9'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/fonts/variable/Asap-Italic[wdth,wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/fonts/variable/Asap[wdth,wght].ttf")

sha256sums=('a6f4d778db0d2a87c2c6e560f71eb018b4253505b2f23c108724dea5d4d74ed0'
            '2ee61562da32e80c98f92513bdcf02f50e464b3f4212766827d7cedb674f1175'
            '9a12babd2ef8bca21cda4467aedc49897a04a213af6423cf6d3c4cc1b85225d1')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
