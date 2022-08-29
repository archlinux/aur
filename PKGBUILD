# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-grenze-gotisch
pkgver=1.002
pkgrel=2
pkgdesc='Peculiar version of Grenze from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/grenze-gotisch/'
license=('OFL')
_commit='7b5eac166bc3b2a519f98b5c124cb7a11670cc7b'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Grenze-Gotisch/${_commit}/fonts/otf/GrenzeGotisch-Thin.otf")
sha256sums=('bca29af2c3c9e142d11f523f414902ab8fb9ab8ffa3c34c63b6b72aa4e7d6acc'
            '11e25db75a19ad845c2841d6149ee01728789714248bfc7fb67ea7a2281642bc'
            'fb217962804b351c69670a8983849deb9bc518998e065b448414c647dff451a2'
            '1a91a44b2aae46160de34e70e2ce31458940b19c5287167587f8297aaa9e3d23'
            'e874490350e734a992ccb7f9d3113593cdf4318f3330bfbfd5131bc156b4e8eb'
            '793a57cdba023078ffc530db656ab10445e45bc33ef793d26917cfa117ae6175'
            'c8efb5de2ce383cbea3f1cd7d01f3f7cc91a2fdcb34a337c598e6958aed9ced2'
            '63987280247b54d3659a35f425f52918ae9921b1de299a40f6962e8648045a57'
            'eec66d5bd2478be33d35b80a79602c265701774175484c4e38493acbe7c10d1a'
            'cd6d84f3fa03e54d3d868aeeffea1d53c97ec22b6963c842a14aabddcf867b24')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
