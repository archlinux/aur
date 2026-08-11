# Maintainer: EclexticDev eclexticdev@gmail.com
pkgname=ttf-baskervville
pkgdesc='Elegant transitional serif font based on Jacob''s Baskervville revival'
pkgver=1.102
pkgrel=1
provides=('ttf-font')
arch=('any')
url='https://github.com/anrt-type/ANRT-Baskervville'
license=('OFL-1.1')
source=("${url}/releases/download/v${pkgver}/fonts.zip")
sha256sums=('4ec852d163fc10903851e3b157d4db11ae7a92881093d4918debd20b58133492')

package() {
    install -Dm644 'fonts/variable/Baskervville[wght].ttf' \
        "${pkgdir}/usr/share/fonts/TTF/Baskervville.ttf"

    install -Dm644 'fonts/variable/Baskervville-Italic[wght].ttf' \
        "${pkgdir}/usr/share/fonts/TTF/Baskervville-Italic.ttf"

    install -Dm644 'fonts/variable/BaskervvilleSC[wght].ttf' \
        "${pkgdir}/usr/share/fonts/TTF/Baskervville-SC.ttf"

    install -Dm644 'OFL.txt' -t "${pkgdir}/licenses/$pkgname/"
}
