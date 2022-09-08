pkgname="ttf-malithi"
pkgdesc="Malithi web Sinhala unicode font"
pkgrel=1
pkgver=1.0
arch=("any")
source=(
    "http://www.sinhalafonts.org/d/13092/malithi_web.zip"
)
sha256sums=(
    "9cfa6b88a22cd12b6c89cd56e6cd0eb145b75ecdaed73fdc25fdfb8835bc36ee"
)

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "FM-MalithiUW46.ttf" "${pkgdir}/usr/share/fonts/TTF/FM-MalithiUW46.ttf"
}