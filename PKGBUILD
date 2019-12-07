# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-faustina
pkgver=1.007
pkgrel=2
pkgdesc='A serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/faustina/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
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
            'd00fce010f968284b55d9bf8f5f92cad3bd5410c8a80d425b9353d7c1b725498'
            '4577781f6cd8df55dd4392b6be2237b976650bd3b2b878da749d8d91ef246ca8'
            'f4e76b4be8e96da98d180c5557aa7797e3157fb3050e34692763276e0e67fc0c'
            'c2afbf545e77b7ae107d022553ed20241d3e3a7dc56253fb10c5a54aa600958e'
            'c8d69cdc6f09e2736d8f823ebf6d1ecc4429c7b602fc863b69df39696140ac27'
            '0b81d5eb20078013ac3ddf49a1417c65f6ce10f2a958386cbe3c7e8cd77aabe5'
            '7266df57ebb4f375c1d6ee6c8749420fd48762ec5c37b84ba847cd2c18083892'
            '53ce2e5c6d18cb74514cd737b1609f08169528b9ff7f35be8b32740136620447'
            '3e7c06f03e346b833acbaf404faa5ac9d396600f4672a83cdb8dba57f3ebb504'
            '86cb948dd5f54cb5f34ab26bd2bdf33301d1365ebba0122116c1b3ed45b583ef'
            '52a58b4d459a0ca5a2dd13b8320b4075937b7bfd2f5138c7e0b3039029e36555'
            '888592d5f5a08436aeb80426af1dc1f9befc945cdab4161c44e28224d152a364')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
