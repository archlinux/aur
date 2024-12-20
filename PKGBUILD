# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
 # Collaborator: Daniel Mirkin <danielmirkin at gmail dot com>
pkgname=ocr-fonts
pkgver=0.3.1
pkgrel=1
pkgdesc="Free versions of OCR-A and OCR-B fonts"
arch=('any')
license=('other')
url="https://tsukurimashou.org/ocr.php.en"
source=("https://tsukurimashou.org/files/ocr-${pkgver}.zip")
sha256sums=('58136fccfdee0923cc83a20996a067b98bae054570ee41bf896d7ca8224399bf')

package() {
  mkdir -p "${pkgdir}"/usr/share/fonts/{TTF,OTF}/
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
