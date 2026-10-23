# Maintainer: William Varmus <0@willvar.tw>

pkgname=ttf-vavin
pkgver=1.1
pkgrel=1
pkgdesc='Garamond-derived serif fonts with a large x-height for screen reading'
arch=('any')
url='https://adrbn.github.io/vavin/'
license=('OFL-1.1-RFN')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/adrbn/vavin/releases/download/v${pkgver}/Vavin-v${pkgver}.zip"
)
sha256sums=('321158c8fb56ec4d74dee921e3361827e9b2729764b787ea0504d47f4529fdcc')

package() {
  install -Dm644 "${srcdir}/Vavin-v${pkgver}/"*/ttf/*.ttf \
    -t "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 "${srcdir}/Vavin-v${pkgver}/OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/Vavin-v${pkgver}/FONTLOG.txt" \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
