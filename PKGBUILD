# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-faustina
pkgver=1.007
pkgrel=3
pkgdesc='A serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/faustina/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Faustina/master/fonts/otf/Faustina-SemiBoldItalic.otf')
sha256sums=('73f1067ce6357d5da461e7973e7fc1092fbf44212730b77759b1b9a4f39466ec'
            '547ec085d37fe15ff2ade229b8492a5a762f0641bb63ff1025083de384a72daa'
            'a7a2083c788298f79ade6e14727f41424331737a18a2820b65dfb97a44cbb8e6'
            'c52f40077522a70a89b3d4fd0e4b5918f0b2c7c15e1c53a9bc8420be81fe9e01'
            '66297d55578a91e2c094304a101186caa1cabd13ac77d7c4357ebb7996c3145d'
            '7e658eb4bcd66da7263da110b8c50f20230bf4ad3e5c877ffbdaed95391af2a2'
            'bfa6676080ffe132689b28d47c97b978a4cb5f32aa408c06319b95d7c8fef668'
            '334e53f8aab9408a175e1855ff604eb2167cd2a76907086ba2eb768a1d5e36af'
            '49244c8befe042e11166e27f0d65bae8d59b5c681927128c3ca1ec6b54d23147'
            '54e7b59e023a3857a73662c403b55e019b07aa6e60b5f9d9ce9508b941922728'
            '639705fbbfc16542a886336c7c794e3d1379f3476d3a3a5683fecb40a3670252'
            'fe8a7c7df832ee7ccafacf5527f072e7b0db771384b13fb9b48e7334b9e12ad8'
            'ccff13ebfc238591307c3f75363b832e5a2206811d88ada355ee446d7ef82afc')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
