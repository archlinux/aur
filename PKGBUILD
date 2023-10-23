# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.3.1
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
sha256sums=('854a871b7f25a21bb31c82f12d1273b6597e7bb1a218a9864d949b2cb74c9399'
            'feecfb44365267dab7929ed51217b698eab48a8fd4b8ea93a7032fe90f16974e'
            '8f0721c2af513e95af59b4c8e7cf51054119e8eded31594217a46ef1db0c4f80'
            '157c54156982b803e2b9528aed3b4c9d038f8926bb47daabe4fecbf3e5bcdf6f'
            '009597a4fd373b547f0ea179fab6902aaa1424010c7c2d2f8f43dcc9db8989b2'
            'd03b6d33dbb1b7e6c65ba481ebcd91c9aae7be8cb64eeac73114da3b557269ae'
            '57525b32b2ae2a852b67c7c5593d4e5a258a6186faee60204148d1d4690ef6e0'
            'b97c85bdd94beabba3802de6b67cffa42d6bf710f1e1e3a5769353af95256d55'
            '01f3de1f8b1b9fe94163b95a4ae1ff5e6e4876d1b5b4d22e477f01e1723e2f10'
            '6a2d5b62a335e12ab7172682a4ae45836573346e369714d4b3fbfa97ba4e5152'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
