# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap
pkgver=3.001
pkgrel=1
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap/master/OFL.txt"
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Bold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-BoldItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Italic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Medium.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-MediumItalic.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-Regular.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBold.ttf'
        'https://raw.githubusercontent.com/Omnibus-Type/Asap/master/fonts/ttf/Asap-SemiBoldItalic.ttf')
sha256sums=('a6f4d778db0d2a87c2c6e560f71eb018b4253505b2f23c108724dea5d4d74ed0'
            'd0fc9666f1027f9888637b86d39e8e71cc34f7fd2e3b4932c9e59a3dfedfd9b7'
            '1f976ee3f61882db150c4839979a2cb01cd32f5ab5e6a25699edb2e25b74b111'
            '83bcaafa6648c79f2033556e7eb970410cd06b21294edf66763622bc9504bac1'
            '0636ae11a24e529ae5ebf7db5f8f94de69afd912f21962e1e281f39251f95996'
            'b40b2ce285fe330a31db01cd4e35d0fac1b64499d12eda933b2cc747f365e677'
            'b1a9dbd81a78c7a4225a7bdcd062a1093ee886a5120330240d35597627b13dad'
            'ebbf8e2255ae4cfa82aaa4b1a8715d2e33383bfab08c883aab85b865342e9b80'
            'a36492c37ae26c5c555220a3206d03a9a34ab82e7f4f670d2e18f9ebd294cf53')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
