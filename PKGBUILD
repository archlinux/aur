# Maintainer: dreieck

_pkgname="icc-eizo-l985ex"
pkgname="${_pkgname}"
pkgver=2002_09
pkgrel=2
pkgdesc="ICC profile for Eizo FlexScan L985EX monitor"
arch=('any')
url="https://www.eizoglobal.com/support/db/files/manuals/umeng/L985ex-en-c.pdf"
license=('Custom')
source=(
  "Eizo_FlexScan_L985EX.icc"
  "Eizo_FlexScan_L985EX-infosheet.pdf::${url}"
  "copyright.txt"
)
sha256sums=(
  'f93cf1f9fd88028dc043fc6fe3b058788f3f80cd5f05ba6e2b53adf4d05fcbaa'
  'bb369709fa2a8828fdf7cc1278c1d1429e0412f27080f30aeacfa32893c26d40'
  '87b2c994c2320c23a75514b49c2e438a3fb9414c5077cd871bfe1e628e34f752'
)

package() {
  install -D -v -m644 "${srcdir}/Eizo_FlexScan_L985EX.icc" "${pkgdir}/usr/share/color/icc/Eizo_FlexScan_L985EX.icc"
  install -D -v -m644 "${srcdir}/Eizo_FlexScan_L985EX-infosheet.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/Eizo_FlexScan_L985EX-infosheet.pdf"
  install -D -v -m644 "${srcdir}/copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copyright.txt"
}
