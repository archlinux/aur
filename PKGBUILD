# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-unna
pkgver=2.008
pkgrel=2
pkgdesc='A transitional typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/unna/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Unna/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Unna/master/fonts/otf/Unna-Regular.otf')
sha256sums=('e542171ed5902b35c863bd1b90cff2c80f97ecfe2c7b31aeb16e951f958f5220'
            '472ab91ebdbe7ca9df7e077ba23a631b0ccc52d0fc82af5d5e712f929c0983d0'
            'f1e33ca0f6d9fd895bd85613c9c0e8d643c1abca34f0cc6f7186fb0ba222f6bc'
            '1a504401b524d18f9a3f904adbc2f6d5654a6a70beee7333ee6f40e5f673c582'
            '4c31e946637467e649b6816484031907f9509b12490060412aed79ab078c41b0'
            '54c049f24935cbe6a03a48180c5776fbe80c684e176f0b272b015235494e4c18'
            'f0b57aba41b2ad9d99da238c69e7fbbe2266d44e6fa7feae6f79e0e2ae5e91ba'
            '7b2120f31f6c733a3023c7f1aa7e846f48ecb3318a603b83f288d4a5cd3e66e1'
            'e296d35402d65379f99eb7bb296ace53c27e9f51a09d4231653843c9e3c5db0a')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
