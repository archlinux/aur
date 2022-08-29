# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-manuale-variable
pkgver=1.002
pkgrel=2
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/manuale/'
license=('OFL')
_commit='20a5ab6a0da1c8cb56916d843e50db0ad6b6dfd3'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/variable/Manuale-Italic[wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/variable/Manuale[wght].ttf")

sha256sums=('6f5869d0892d8c06cabcccce3726cacc849bd0a96b83bef5850402ab2b9fce71'
            '13eb20f22e8b6a28eba93670219cb472980e8fd006319a917316434e2ed1961a'
            '19ea09ad2fbf321cf8f94ac3f66547bc9b2bdf3723a2f073615eaa02fe17ded6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
