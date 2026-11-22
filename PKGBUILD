# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo-mono
pkgver=1.008
pkgrel=1
pkgdesc='Neo-grotesque monospaced typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='384c6d3ad00f76be6f76f998a310335e3eb460a2'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/fonts/Chivo%20Mono/otf/ChivoMono-ThinItalic.otf")
sha256sums=('c9b69fa18c372df2b187b49efc57b1ea643b86a938e5af32f6b5a7af1017c891'
            'a493ffad6bb19d65dd3fe2ebce017f9ba14f672b3718a9491940cd7680d1dc67'
            '4263020301824296dd7efc568306134aa41e099e43f41d2945f6b607bbdb0602'
            '042945e680d9e972b02810543e7bb66955e0747e5371f15d252a5e3cfb4a7266'
            '7a2270e9019fc7bfdc3c4ecc5664b99f9f3ce03053214ec8984907a65261c042'
            '56eb15e66050d4efa58a57a8ef9ee57c740c5cac32da84ae18bcb3c157daaae5'
            '031bbe2eb917c0649c0702649d31aa3a0f90b0ef76fb6803f11698ec4e5f14ec'
            'b344166fb97d6aa0dc1750524926e870d108203d356aa11e105e78880e348485'
            '9d0aaac8b205293c99b03ad8c639e73cd0f34d000bcc0936721fe27596d3e063'
            '784abaa36934ed03a9abe10d503ddd3e39f11f036cc3bf1aed886d43d9af0cd7'
            '693900d54342cc5538e17ad63d13420d5e09db99ac3256824cccabd21efc20ce'
            '18308956a77011b835e722118da56743195893fe682bcb777d4d16f9d3db7ba5'
            'cbaf7d43978761b5bb67193921a023034de2e385da1f8ad1b3a0139e7bf95d51'
            '3e5ef67bbce8241cefa2c1fb0cb0ff48f7343b6e96a8cd2292bd3c1a4f414bf1'
            '90318345cb79e36b87f515d3adf481679635b6ae3b0d88f367b3e449181f215d'
            '437803844f264c17006f9e29317abdba636b35ecd9c46fa63f744a9e3cfbee14'
            '582eda973cda0bc5e1942a56726fcfe085448a236f09e1c79900f52e7cd0caa4'
            '3d988a4d30fd95fee45555db49471f270785081bddf10194fe6a9fdc96c2c733'
            '1cfece25bbeb58348816d1db3030b1bb2ca4dff6865be1e1487774c1cb71a78a')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
