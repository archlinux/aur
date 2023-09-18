# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.0.0
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
sha256sums=('51c6c0fda0eccc2f4fc3a0205af67c9e8ab32bc3f0cbf926005dbedef8287435'
            '8194b7c4d34df4b2fd4f148340fbd2b08fd23eab2ed8107d801edbb8963a827e'
            '50358459d582fd243fe28183864e4d071ed4e03a9e8121d2c43678a2f8f30c8f'
            '142fb6de62025d5ce650c8f52b8a8ee9405e4753242be24724d424f9d7bb150e'
            'a621ccc44477b64588b24c0574560f269a579bdb1fbfd89c535c32aaf720743c'
            '3d525e9dd3669ec8c5964e6662b31bde29ee20ee288382547c2b71c6dc75d002'
            '12c07d282ed91a60fa85325c8c4bb677388056594c4ef01d151402f70bbe5434'
            'b5c1d4fa14ccfb67102f95e69703bc6a829332a0625ee224b2af1cfdb57387b2'
            'c123029795cf8895dbf49fbf7ec7a1dd28cc6572126cd12b2182f38f4685208c'
            '86ccec46e6a0de9a9e7cc76d050119e4fba570b1c592c0fa2114d70f199effba'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
