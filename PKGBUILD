# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: LightDot <lightdot@gmail.com>
# Contributor: Martin C. Doege <mdoege@compuserve.com>
# Contributor: Martin Florén <martin.floren@gmail.com>

_ffname=raleway
pkgname=otf-"$_ffname"
pkgver=3.0
pkgrel=2
pkgdesc='An elegant sans-serif font, originally designed in a single thin weight'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_ffname"
license=('OFL')
conflicts=('ttf-raleway')
source=("https://raw.githubusercontent.com/google/fonts/master/ofl/$_ffname/OFL.txt"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Black-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Black-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Bold-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Bold-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-ExtraBold-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-ExtraBold-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-ExtraLight-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-ExtraLight-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Light-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Light-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Medium-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Medium-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Regular-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Regular-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-SemiBold-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-SemiBold-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Thin-Italic-Original.otf"
    "https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/OTF/Raleway-Thin-Original.otf")
sha256sums=('e588abf45ca2b19c340c4b27349c9b6b6e5e198316fd965128ed9f4422942cbe'
            'e9bc1e494db53bf75cd1b473dbbfb56d97c5ac8a46250e13660c3445b80d794f'
            'ecc6a566e02eede718c381346335fd7ea641041d8dc5efe2429704de43cf3c5b'
            'bcd81fbd6fca5a94d7974328298b3b8ba00b257c6d4ef7f36aba7f4a7acef7a1'
            '8ab3eae9c6e7223cd75b0c63e5df991878744b4ec2e9be9ef5b5a0603af218ed'
            '0cf83b586a099526083ea7d71b656e8f8cc222e727b76dba76679de1692e67ed'
            '2b5b02a483eb52fbbbf9500c900cc01b0948601abf0a20c184973c31491a62cf'
            '01b89eb72a3af9a8de257b8e7e35d13478930ad54051fe5b44e94a563c1258e9'
            '2f825a260beea7fc8666be9e4b3c8fb4676bba02a5ecbe724377ca8d9be51af1'
            'e8ffff5a4e2e60f6ab41bae833015ea44925e9fa66a608c8fa788c430b893f60'
            '719e1d5fddf54d77bebec412ee35a305d1f4b0de600b116d763412d42612d5ad'
            '208d6042c17111ac8665c8da855db272fffc2c4760a7632c4438b3be0f719e8b'
            '67891be122c37bf63cc1895d4ec5d6b84e4f5988d1b746da49250ea052a7b062'
            'b326e6b9ba787f13ce1050f8fcf70082631be70cdf4fe17613a565479d020ec6'
            '339e4923e0cfd6d378ce58df1a82017ce5e06c33ac15b568c9b026de1c887976'
            '96497d40c232a3fed800c0c9e98662af19b3bd7b545d701194600f38df5c2746'
            '4f11647c0efaea39446099fe5bd2351c183b868072b6b1b470b137c8f93e6340'
            '84463eefb38e858242d8944063125058f0b987799669102f2fabcb8edddf230b'
            '0b31399835977f952ca112db90620109b82a1aa182bd2334e07e0d721d38fb6a')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${_ffname^}-*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/" OFL.txt
}
