# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-archivo-variable
pkgver=2.001
pkgrel=2
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo/'
license=('OFL')
_commit='b5d63988ce19d044d3e10362de730af00526b672'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Archivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Archivo/${_commit}/fonts/variable/Archivo-Italic[wdth,wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Archivo/${_commit}/fonts/variable/Archivo[wdth,wght].ttf")

sha256sums=('108b4e57c9c796d3d38d0428ca7ee39de47ad93187302718d9b2d8864b9b716b'
            '99e6e9a40bc1af881cfce9229e3285e6b35fbeabb7bfb3b42f8899f8d9aba12b'
            '664bbeb10522dac35c174a3860aaecad7b1ad3a0fc8b0d26888e26c824ec556d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
