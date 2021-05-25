# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-archivo-narrow
pkgver=3.000
pkgrel=1
pkgdesc='Grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/archivo-narrow/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-SemiBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/ArchivoNarrow/master/fonts/otf/ArchivoNarrow-SemiBoldItalic.otf')
sha256sums=('a4087edf95fb2a6bd38073ad005ced611695dc9d7d8fd5d04a888ef4f9c748ea'
            '5ba4433e127943cc2a9b4ece37f29053b4de0b78d93ce7cdfc66c73857fb8ef0'
            '6330b17416809bcb07b2204e7c2e2c7399edfbf1df577375591b7caa1f3812b6'
            'a2ab074ddebc4c45a461a944807aa880446cf060e9879f1bff3293bca1d448fd'
            'e5a07bf356753281bf50ab6d0b35cab4364feaa449bcbaa13af39fb187522c2c'
            '2555cff0e03b0fd031503edc5878c22a042478ff3e706ac41a614deca840af16'
            '19566c63154e56dce9124418c98378c5714fad3b278fae80eb108763b76d4ab9'
            'a0f9c33aecca15d600dca24ae3038e2518893fe9bbc33703a4dd094966a2b40b'
            '19638eeb69ca104ac333c75e8f654e208c378be90f71a64a651d2efbf082a054')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
