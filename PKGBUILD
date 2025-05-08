# Maintainer: CToID <funk443@yahoo.com.tw>
pkgname=ttf-tw-edu-kai
pkgver=5.0
pkgrel=1
pkgdesc='The regular script style (aka kai style) font for Tradtional Chinese.'
arch=('any')
url='https://language.moe.gov.tw/result.aspx?classify_sn=23&subclassify_sn=436&content_sn=47'
license=('CC-BY-ND-4.0')
source=("https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai-${pkgver}.zip")
sha256sums=('57411e9ca399f372bda62fadd521a875d2062d34a0c654ace4a4c61539f3e10b')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
