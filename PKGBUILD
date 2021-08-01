# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss11-super
pkgver=9.0.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/super-ttc-iosevka-ss11-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('6c5603240989b296e6cda2c8eed0ec4745ebd5ccb34b2b7e9ed77140b8f5a489'
            '72c3d557ff41d871680652f56afd565ba6834c90eadc45a4ec15410dce1c0c80')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
