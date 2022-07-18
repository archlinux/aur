# Maintainer: Danilo Bargen <mail at dbrgn dot ch>
 # Collaborator: Daniel Mirkin <danielmirkin at gmail dot com>
pkgname=ocr-fonts
pkgver=0.3
pkgrel=1
pkgdesc="Free versions of OCR-A and OCR-B fonts"
arch=('any')
license=('other')
url="https://tsukurimashou.osdn.jp/ocr.php.en"
source=("https://osdn.net/projects/tsukurimashou/downloads/74864/ocr-${pkgver}.zip")
sha256sums=('9091dc8ca4fe13ac47b34ea98e795039c9e5432357184c8891af94dc796284fd')

package() {
  mkdir -p "${pkgdir}"/usr/share/fonts/{TTF,OTF}/
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m 644 -o root "${srcdir}/ocr-${pkgver}/"OCR*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
