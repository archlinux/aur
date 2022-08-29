# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-slab-variable
pkgver=2.001
pkgrel=2
pkgdesc='Roboto Slab is a slab serif addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
license=('Apache')
_commit='56bcfeddeae694babdb34c19ebe3956b17829699'
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.txt::https://raw.github.com/googlefonts/robotoslab/${_commit}/LICENSE.txt"
        "https://raw.github.com/googlefonts/robotoslab/${_commit}/fonts/variable/RobotoSlab[wght].ttf")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '18137628b2731ac8d093c552b3a71abfc958bdb132ecf29a71614309c82836d9')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
