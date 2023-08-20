# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.3.0
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
sha256sums=('c0eb34c31c970906e33e392aa2de1b23dcc60608d2bd489e55fbc34f37f44bf7'
            'a289b5f65f54d4827fe388d8bcaac32c44dbcd0669fba89e97aca2d0010cd377'
            '68cf213bff94f848d58041d7e1f5d7cf918d715665c7adaa5a67cc1be7898163'
            'b3fd9e3227b8a63676308ec4ec857b378f73c194ecc1c38330de13d108fd67c7'
            '15ffc24046f1fdcac4ccc3787075e09cb7722f2967354b69c586e749470ea327'
            '18966e5f1cdfec68a9bebd7159e5ecd5694570fbe77e80165b786fd32f5f9c98'
            '673414a13861555a4093ab9d744b523e84ef22abfbb403fd012bd2f73549baa2'
            '9db8efe249ec7ad06e8d1dc478d9fa877356600ff20683d45894fd91cd682cb5'
            '64163999aaf1b2d40bda7f2d858e39d13430888571f027b6b5374744e1f04942'
            '311867a887d3f1648d7933d084707efdcd1ffae8589a905010e14ee8afcb5d49'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
