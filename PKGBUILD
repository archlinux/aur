# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-grenze-gotisch-variable
pkgver=1.002
pkgrel=1
pkgdesc='Peculiar version of Grenze from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze-gotisch/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/master/fonts/variable/GrenzeGotisch[wght].ttf')

sha256sums=('bca29af2c3c9e142d11f523f414902ab8fb9ab8ffa3c34c63b6b72aa4e7d6acc'
            '701b299d8dc002a2b4bea2ff0f1272c0e4081a2835914354804565c410d0c637')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
