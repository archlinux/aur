# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap-variable
pkgver=3.002
pkgrel=1
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap/'
license=('OFL')
_commit='ca471c0ccf90a5c66155d4bcaa020859804ffd00'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/fonts/variable/Asap-Italic[wdth,wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap/${_commit}/fonts/variable/Asap[wdth,wght].ttf")

sha256sums=('a6f4d778db0d2a87c2c6e560f71eb018b4253505b2f23c108724dea5d4d74ed0'
            'a21e12f9babf2d02526003b27dff884b6d1cd0fed883ffe7740725626a11dd59'
            '7bf29bcab72f7d00de600e964a3fc206620050d8448ddd976822378d0fe18028')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
