# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.4.1
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
sha256sums=('b4c46ec608c61f667c92580b7d640433deda6f6194691bc91c2d29f3f38fa23d'
            'b78ef01f206c7da3b7837ab5bbfe58043afd13d9ccfbe0a240359ec550a24e6b'
            'ea2c1357debba585adaed7eeb52cb56d12855960f2a27b1b0b83bd0cb30b8d93'
            '2865137a5ba9418b05b8bb2e525c283ea711affe8e9d3f5b31be37ec54e8a049'
            '68d91ce3a837d78f033cfca61982a8f684928696c6e11b46a622383506e8aec3'
            '878af1fdf285985b1245197d9caf76e00afe097e0decf75db06900355c6c29bc'
            'dc634375f09768cc4b6e37a5e5d89ff37e1ed0fb7f1286f183bc4a51aea4e8e0'
            'e4bf15b4664548a731e858be10fe226a56e92e3a94ce85d93ef190ca0318090d'
            '94cef97f5ddb291819021c419e16ab8330bf59675a245f7311c8c333a4019eeb'
            '77f12ec748769cfb2821fd34affb552bbb1db5b2c54427b894da88918db98e31'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
