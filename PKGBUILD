# Maintainer: Danilo Bargen <gezuru gmail com>
pkgname=ocr-b-font
pkgver=0.2
pkgrel=2
pkgdesc="Free version of OCR-friendly sans-serif monospace TTF/OTF font described in 'ISO 1073-2' standard"
arch=('any')
license=('other')
url="http://ansuz.sooke.bc.ca/page/fonts#ocrb"
optdepends=('gocr' 'ocra')
source="http://jaist.dl.sourceforge.jp/tsukurimashou/56948/ocr-0.2.zip"
sha256sums=('39289c641520265ecedbade99f01600f316f8196ec57f71c8402d3ba09438666')


build() {
  mkdir -p ${pkgdir}/usr/share/fonts/{TTF,OTF}/ || return 1
  install -m 644 -o root ${srcdir}/ocr-${pkgver}/OCRB*.ttf ${pkgdir}/usr/share/fonts/TTF/ || return 1
  install -m 644 -o root ${srcdir}/ocr-${pkgver}/OCRB*.otf ${pkgdir}/usr/share/fonts/OTF/ || return 1
}
