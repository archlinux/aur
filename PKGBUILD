# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-fixed-ss17
pkgver=33.3.5
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaFixedSS17-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('5cbfec6a64f875727a6ed4bc4e6c6b4ee79ab132dfab3c9705293a4e72ba98c2'
            '52579dd4ebbda8e5a9d314e395dbfe40de82b4b7b3007ec8458876823af8dddd')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
