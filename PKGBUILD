# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-faustina-variable
pkgver=1.200
pkgrel=2
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/faustina/'
license=('OFL')
_commit='eaed5823e55b6256571a2bb379b5203083cab452'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/variable/Faustina-Italic[wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/variable/Faustina[wght].ttf")

sha256sums=('73f1067ce6357d5da461e7973e7fc1092fbf44212730b77759b1b9a4f39466ec'
            '215b9bf63da0c9584b5a0aa8e2270da6a2b62c1281f5c39089613c3aaeffa2be'
            '2ce2606f0ee1d493873c24818a391e02606ee76ac924b3d985cbb820c0a53ea5')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
