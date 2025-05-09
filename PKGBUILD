# Maintainer: CToID <funk443@yahoo.com.tw>
pkgname=ttf-hanamin
pkgver=20170904
pkgrel=1
pkgdesc='Serif fonts that contains almost all Kanji (Chinese characters).'
arch=('any')
url='https://glyphwiki.org/hanazono/'
license=('OFL')
source=("https://glyphwiki.org/hanazono/hanazono-${pkgver}.zip")
sha256sums=('571CD4A09AE7DA0C642D640FC2442C050AA450EBB0587A95CDD097D41A9C9572')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
