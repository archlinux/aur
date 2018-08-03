# Maintainer:  LightDot <lightdot -a-t- g m a i l>
# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_ffname=raleway
pkgname=ttf-${_ffname}
pkgver=3.0
pkgrel=1
pkgdesc="An elegant sans-serif font, originally designed in a single thin weight"
arch=('any')
url="http://theleagueofmoveabletype.com/${_ffname}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-raleway')
source=("https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/OFL.txt"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Black.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-BlackItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Bold.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-BoldItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-ExtraBold.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-ExtraBoldItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-ExtraLight.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-ExtraLightItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Italic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Light.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-LightItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Medium.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-MediumItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Regular.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-SemiBold.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-SemiBoldItalic.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-Thin.ttf"
        "https://raw.githubusercontent.com/google/fonts/master/ofl/${_ffname}/${_ffname^}-ThinItalic.ttf")
sha256sums=('e588abf45ca2b19c340c4b27349c9b6b6e5e198316fd965128ed9f4422942cbe'
            '5d2aec83bf60483dc15a92e393a12be3f19245e82fa913c3a55df4dd810c405c'
            'e0f379b4e2f8d735fa6b189a1d095c17a11e5ab9fd755c87fc6bb64f3779b801'
            'ca9de8b3be7ccd4b80774a9c7dd56a98c49c276771c5957729b5958d1d579112'
            '647fb029a65c0cd0b5a64a1d178ee4e118731e963cb1ef62cf24427b8b251c2a'
            'a89c06c1793eb0b173c2101744cf53ea66f8b24b360f5aef7649f6f2b7120e9e'
            '43ee1a9aabfef25012cdfd38d683760f7e9c9e5d90adfb02125b4e1b602c7e6c'
            '2620b63bff6f16fb1fa5e28209777cfdfc51a0c8aa1d54ea24a590541e2fd54f'
            '02e952d32fc8fe96cddd4c3350d4a809f151e105de14d935974c9a19f3b6bac5'
            'f9c5e089b4bb57662171cc7120e1dcae8d66432b4447dd7a7babb0c5e06aa93e'
            'b3d8986142d28fd27c5158b5d24b072bbed301b1763fe0bfe3076a631e8ea0ca'
            'c767a43c0012cdcb76e32f2f3b5005e054ba60fcf52653f7c456f0044e14f1d3'
            '3d8a045b2c853ee51e5d734d3b53eacf3f5f5290d6b5b862134af53b29dd6818'
            'f7ac99eee53833254c89097c36ec68c0de390377cd31b4c1c082ec3b0132862e'
            '20e4ae409ffbe8bfd2af14d7f717398408ae8b481005beccb83d62ef4052b681'
            'b7680f30199f65ce3b2620713f7cb27a175560ea7402e0b4cba01c5d54508a17'
            'b8d486395fa65b66cb63321cb4a277d51035fe4d0bd9b49edf8322ea9d55c42c'
            '59ee38a0d6f119171f896098603246f2bfc5780d75d23c3298b66a03b45d32db'
            '961a831acb582dbc3ed7d79dc991118d60238c8683c50584e126a293a881264f')

package() {
    install -Dm0644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${srcdir} -name "${_ffname^}-*.ttf" \
        -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/{}" \;
}
