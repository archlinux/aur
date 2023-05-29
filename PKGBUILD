# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-super
pkgver=24.1.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/super-ttc-iosevka-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('52207eccbf8dc8cad208f55efb6ba692361ef6de12faa0716b36a2a123db5522'
            '7484961b97b41985d54c21700e53f7142a7007d72401acbd32c0b9c6a5a0b558')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
