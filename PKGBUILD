# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.3.0
pkgrel=1
pkgdesc='A font for code.'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL')
source=("https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-bold.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-bolditalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-italic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-light.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-lightitalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-medium.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-mediumitalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-regular.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-semibold.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-semibolditalic.ttf"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/aaronmbos/monocode/v${pkgver}/LICENSE")
sha256sums=('2a3a4ac8c4991a5a22a1529793cb91110086589d034d800370c8b180a4fed362'
            '54e6cfd06a404b9df4ee20900fa3a19d20e92756a55d9de7050069b13cffc4aa'
            '2acedded9bfc5bff12d7462b053bccb0abd48fe89bc67473fc5f3a462c5da759'
            'eb62e9b13cac6bde50d12e4ef266e8aacca60c6ab559130b1e39e667a299cdb4'
            'e880833be36a6f2f1bd9208c21f83d77f92587030131488416bd7cc311796143'
            '4856aa3390be84277af53bd7b8636b943ec3f555dd306fcf1cc0e123b679026e'
            '0d4399ee078d8b4daee7b7f3cd473a911c3586e38e8831a558ea600d3f676760'
            'b43ba5116888c86448948d5d33467d355cf8f584d46f7c765e7b3936c7275ff8'
            'c6e0306c42b4d4338e17cbfc4fdb47fdb9afe829bbe6ad7b5aa9e68441aa023b'
            '4573cee19389027ca5247b31cccabe8770fe9e2b816b932feb2c05cec7e10414'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
