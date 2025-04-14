# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss17
pkgver=33.2.1
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaSS17-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('ce0db176190c11b00c1518542d4f77109a454e83eea44e3db1690dc699f33b73'
            '52579dd4ebbda8e5a9d314e395dbfe40de82b4b7b3007ec8458876823af8dddd')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
