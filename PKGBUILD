# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-narrow
pkgver=3.100
pkgrel=2
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-narrow/'
license=('OFL')
_commit='b426cd5284c8171d4396f297c0c51ebf51095a7a'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/${_commit}/fonts/otf/ArchivoNarrow-SemiBoldItalic.otf")
sha256sums=('a4087edf95fb2a6bd38073ad005ced611695dc9d7d8fd5d04a888ef4f9c748ea'
            '4be36985bdbfcf70970ae1a48200063ef3a46228d32231ff01b9289af57bdcfc'
            'b9c5b17d1ccec6f624c9bf3f314f8807c8f1672a1a4c538ecbd61a58427097f2'
            '755717a8e5a24ce5073528e516cee43478416eb5c333d86905048e403b899fd1'
            'fa8d5eb4e1d35f2ad39a75610b8589c43a9de9ea2b2365db6cb9b6a86db7068d'
            '5c8924376a27c9ec72448adfbe77fd5e210950bebdd4acc424cb109f7bfa5641'
            '8238a3e8757bb965d3b0b6bf38001161ca510b88e2ded704a76c5ef8746f2ab4'
            '48724f3b306d76d1b9128bed1d0948f51169b97202961fc6f6850496ccfde27f'
            'e3eb15166ad802fdb1116ac731bab527ab8ca38c1694827dff95251a7d26bab0')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
