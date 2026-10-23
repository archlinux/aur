# Maintainer: William Varmus <0@willvar.tw>

pkgname=ttf-prologue
pkgver=1.002
pkgrel=1
pkgdesc='Sans-serif font family derived from Epilogue, with revised italics and vertical metrics'
arch=('any')
url='https://fontlibrary.org/en/font/prologue'
license=('OFL-1.1-no-RFN')
# Pinned Font Library archive for the fonts' embedded Version 1.002.
source=(
  "${pkgname}-${pkgver}.zip::https://fontlibrary.org/assets/downloads/prologue/2f1c57b8cccd1e2973e6a37569be5e91/prologue.zip"
)
sha256sums=('a235f9e8a2a55957b994930b6d53078fdca8d80008a14430a610c1c51fcdb88a')

package() {
  install -Dm644 "${srcdir}/Prologue-"*.ttf \
    -t "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 "${srcdir}/SIL Open Font License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
