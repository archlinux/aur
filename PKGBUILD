# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
 # Collaborator: Daniel Mirkin <danielmirkin at gmail dot com>
pkgname=ocr-fonts
pkgver=0.3
pkgrel=2
pkgdesc="Free versions of OCR-A and OCR-B fonts"
arch=('any')
license=('other')
url="https://tsukurimashou.osdn.jp/ocr.php.en"
source=("OCRA.ttf" "OCRA.otf" "OCRB.ttf" "OCRB.otf")
sha256sums=('db3a70dcfab1fcc0e32f88f9413876dccd267a0e377dd8afa7a18e4fe7cba018'
            'fcd7179e54867b9f4dd826dc4c8cca0caf93d71875b73d684f4d02c32493d7d7'
            '67b11c470222c7bb4550e7d4c216fd06145a939208af77e5f946bcee53e70868'
            '87c8d5bfd541d28023d2ba3383169c49f565e10d487ebb027ea0d735ef558707')

package() {
  mkdir -p "${pkgdir}"/usr/share/fonts/{TTF,OTF}/
  install -m 644 -o root "${srcdir}/"OCR*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m 644 -o root "${srcdir}/"OCR*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
