# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-manuale
pkgver=1.002
pkgrel=2
pkgdesc='Serif typeface for editorial typography in print and online by Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/manuale/'
license=('OFL')
_commit='20a5ab6a0da1c8cb56916d843e50db0ad6b6dfd3'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-Semibold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Manuale/${_commit}/fonts/otf/Manuale-SemiboldItalic.otf")
sha256sums=('6f5869d0892d8c06cabcccce3726cacc849bd0a96b83bef5850402ab2b9fce71'
            '984bcc3eccac32713e49ff33bc4ac59c64c59aef5da9f6ac8dbbaf9219efee42'
            'ee9df0e749f1421ffe1f5e9655784625ecd01c44545df45ae77278ef501ce0d6'
            'b963f7377f49bd93f2713df4fd7d14029aeb9f1838db5688daa4abb326d4c914'
            'bf433da7f3956bd52119d253a651034aa282f8887ac4e0c1ff5410b8de1f05ac'
            'd05221e07d113f330d4e62a2caee33beee3c13895df60abc828cf068a66a6342'
            '3012b19769f92379054b620cb9bfe22b5b7d8fcd5820ffe341c5c83975f6a70f'
            '5cb1d14512c7cad1aae11782da20038fb42807301659ef765c65b40530fb9559'
            '9a1de51b82793c4216a03ebee091a9c81642f64a40c9540c5143e89e814a1b89'
            'a943c31a4502fdbc4ad38e2968b8dbef86f9e67e361e412da30d06050c9ee84b'
            'a2e809cf359ebe3e941b2f7d2b8c407d29e29f4084bdb38a6f75efda83bd5fcb'
            '9039e66da3aea75af04a9b38b9cef88ec8826483f3706a455d1388a2dd84427f'
            '333a55fa88aa46e294674b15df2cd64224f7beb86d502858b2d1838b13fc08bc')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
