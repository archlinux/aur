# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.2.0
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
sha256sums=('9a9cbc6fc36a708f80c6516ce1a387e6c3c41770527bf432692777ae985af7a7'
            'ffcfadde9de52c1c651330b8d2a1725199388ece1b712a79497b33fc22d5c5fa'
            '59656834280642f3cc67cda2d873e5e44469f9b78b8aea9d71d41ca96578cfdc'
            '2576dbfcf48e7b2a262d625afb262d12a6f646565e65cdce1f84f6f2d1d173d4'
            '80169fc24ce1b18b7225e5f508061070ff0caf236530367f9e327f75a93ae626'
            '4aebf915980cde6cdee431e73174decf90aef414d83d788269df06bb7c3942eb'
            '8b938f89ffdf696ddda43cc33d5169ae8a2ee6c1ef6209eff344a76e738bd0db'
            'a8d4ddfe1c2d1daa9a8c9f5de8b43d12084f345c7f5ed0806a8a8b8a9f6dbbcf'
            '6233163b1dbc7ff9473fa085a9e106c1f14cc65b9c63ba1550a6dbdb145ab22a'
            'd398a7b0a92b23c5468574179033440b0bbda36bf61c689d2601c5bb7e1d2244'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
