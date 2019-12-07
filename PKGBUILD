# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo
pkgver=1.007
pkgrel=2
pkgdesc='A neo-grotesque sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Black.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-BlackItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Bold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-BoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-ExtraBold.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-ExtraBoldItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Italic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Light.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-LightItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Medium.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-MediumItalic.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Regular.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-Thin.otf'
        'https://raw.githubusercontent.com/Omnibus-Type/Chivo/master/fonts/otf/Chivo-ThinItalic.otf')
sha256sums=('2dc4ff442c2dadcdd69513a3229bb1548880e4de76849965db85a567d96e26ca'
            '6d4004332aaded4a33e21dc0cef06cd7020cf7111de8aeb0118bcac9ebef56e3'
            '7bb21ff83e24096566db45f295aa9276233af3ce6ab4e296295fe8e85d4561ff'
            'c448b41b230c75aaaade4427bd3fd883e931a9601665bb009d3512d73c1a0b1c'
            'd939cbc7f235283551a82e9e1f924d780b331b0988006227c43b2ee20fff5123'
            '363f098ee3190a06b42c05a761f400207ff9d9dc9c364d698dd5c56fdc4167d3'
            '169fa2e8b04e9211b66b90c209cec511d571d3b3c3a65f2ac4243bbe43278977'
            'adf15537e16ad22e97be24adfa14a8c471979f4f5e5651d6d1d48e0a10474b4d'
            'd550e71b6930f87342ce7078968fcd25d0056f59448dfa1d63365687cdff76b9'
            '3028ef70449964776b18d1d94dfaf3d6c75b2ed859c53cf190eb49fa918c82bf'
            '44943694e2871236e66d83875bd58bc706dea9e1667fd328a83f3d32c81f3b07'
            'e4991c61b2480efc7204d53443563f6dfcb3a19f8b69b82c5d186f1cefa0d70c'
            '0bac9bb6408c5a9f22700a2866097a5c3f5d4eca5e5a6ac7f169a721fd68f1db'
            'c7a2105aaebbf58f44009b91dc1c7c545f8be287e0a6e74854faa0546ddf9269'
            '0710add99816591db8d2ba68e49d6d76d0a828f43be2ce5c5a4bcb74c9a4902d')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}/
    install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/${pkgname}/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
