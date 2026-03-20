# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-grenze-variable
pkgver=1.003
pkgrel=1
pkgdesc='Hybrid typeface family between Roman and Blackletter styles from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze/'
license=('OFL')
_commit='6ea8fdca83c9f9655da7e23bf5ec002a6acf0fcc'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/variable/Grenze-Italic[wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze/${_commit}/fonts/variable/Grenze[wght].ttf")
sha256sums=('55a21d1fcebfa5e02100db3ae4dcff2658e9ba63e0b64149203bf6a9d645db86'
            '69500ece8fb369db20a2e9b129f18079bfeada7a6ab17c7dbe296a493d8665a2'
            '0d0d869d66b56cb23bf1e803c9e75a250885bf2c614c1ce82e56bebc3db27cb5')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
