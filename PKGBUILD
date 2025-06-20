# Maintainer: goelzma

pkgname=vosk-model-en-us
pkgver=0.22
pkgrel=1
pkgdesc="English model for Vosk speech recognition"
arch=('any')
url="https://alphacephei.com/vosk/"
license=('Apache')
depends=('unzip')

source=("https://alphacephei.com/kaldi/models/${pkgname}-${pkgver}.zip")
sha256sums=('47f9a81ebb039dbb0bd319175c36ac393c0893b796c2b6303e64cf58c27b69f6')

package() {
  mkdir -p "${pkgdir}/usr/share/vosk-models"
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/vosk-models/en-us"
}
