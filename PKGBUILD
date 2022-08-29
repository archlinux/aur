# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-faustina
pkgver=1.200
pkgrel=2
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/faustina/'
license=('OFL')
_commit='eaed5823e55b6256571a2bb379b5203083cab452'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Faustina/${_commit}/fonts/otf/Faustina-SemiBoldItalic.otf")
sha256sums=('73f1067ce6357d5da461e7973e7fc1092fbf44212730b77759b1b9a4f39466ec'
            'e19491c8c35a2c88f8697bb8421f8292a3ca9fcf0c493988ff5eda01831ae240'
            '35b66ca6ca922d4ac2bfcec9f7da9ae9bafa5d5c75c54a9d781b723424ff0bc0'
            'd8beb21f723cbaa4bf75ba31fb8501bad79c238caec0ae9a279f795e930024fe'
            'a14a3f0ffa071d571da9c247993228b61b1fa19598509caa7af316ff3651bdfd'
            '6c63ad745b2e135a1150cec180645e873e47bb6b1d4babe146f65b3c2c48dfb4'
            'cf2eedf0381cf2dee64c1042fc2ff3b19f24feedc1474a442b8aa86c950bf990'
            'a19e07750f04a42e779de345a5f8cf27ce39ad7ddd3e2ac80f5dfa996f9133d2'
            'a12588109f634461a5341ae6a0444998cab290472e29de92fd7480887a504a2a'
            '993d1fd7e88728160e7b0c587cfaf9858e82ba4f2bb19b0967b4cb585039834a'
            '991cfcafb4eae6ea650092adcf251143a440b9397f7d29389bc5ffcfa602b8b7'
            'a19012eb89a05f328f1d567a94b65a26e461dc2c992967de74e7896ccf7f2664'
            'c0c7c207969113d4f104e5a708ecfa18da45ba8fcb7bb5c5f6d96c1effa5dce7')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
