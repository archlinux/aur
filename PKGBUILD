# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
pkgname=ocr-fonts
pkgver=0.2
pkgrel=3
pkgdesc="Free versions of OCR-A and OCR-B fonts"
arch=('any')
license=('other')
url="https://ansuz.sooke.bc.ca/page/fonts#ocrb"
source=("https://jaist.dl.sourceforge.jp/tsukurimashou/56948/ocr-${pkgver}.zip")
sha256sums=('39289c641520265ecedbade99f01600f316f8196ec57f71c8402d3ba09438666')

package() {
  mkdir -p "${pkgdir}"/usr/share/fonts/{TTF,OTF}/
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
