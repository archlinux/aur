# Maintainer: Janet Gonzalez
# Contributer: garlicbreadwolfs (garlicbreadwolfs AT riseup DOT net)

pkgname=shanggu
_origfilename=Shanggu
pkgver=1.020
pkgrel=1
pkgdesc='CJK Fonts'
arch=('any')
url='https://github.com/GuiWonder/Shanggu'
license=('OFL-1.1')
replaces=('otf-advocate-ancient')
source=(${url}/releases/download/${pkgver}/${_origfilename}MonoOTCs.7z
        ${url}/releases/download/${pkgver}/${_origfilename}RoundTTCs.7z
        ${url}/releases/download/${pkgver}/${_origfilename}Sans-VF_OTCTTC.7z
        ${url}/releases/download/${pkgver}/${_origfilename}SansOTCs.7z
        ${url}/releases/download/${pkgver}/${_origfilename}Serif-VF_OTCTTC.7z
        ${url}/releases/download/${pkgver}/${_origfilename}SerifOTCs.7z)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
package() {
    install -Dm644 *.ttc -t "$pkgdir"/usr/share/fonts/${pkgname}/
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname}/
}
