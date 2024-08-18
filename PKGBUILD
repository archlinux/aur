# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-fixed-slab
pkgver=31.3.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaFixedSlab-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('c17b32e800844d37571cd74b3be77e17bc9ec1d352261a6e3a620ed5134f2e49'
            '8c914a5c7d8d5e5be1ae07fd8591b437ece15b665f6ccc913cea050ffa8448f7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
