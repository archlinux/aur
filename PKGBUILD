# Maintainer: nny <warezurun@gmail.com>
pkgname=ttf-kibernetyk-mono
_fontname=KibernetykMono
pkgver=1.0.1
pkgrel=1
pkgdesc='Geometric monospace typeface inspired by the Ukrainian Cybernetics School, with Latin and Cyrillic support'
arch=('any')
url='https://github.com/PavloKilko/KibernetykMono'
license=('OFL-1.1')
source=("${_fontname}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_fontname}-v${pkgver}.zip")
sha256sums=('6ba7fbe85a791c252076e95a352ad6449af8e0b90d5ddc8663d4581ff400ae57')

package() {
    cd "${srcdir}/${_fontname}"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" *.ttf
    install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
