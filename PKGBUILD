# Maintainer: vvch

pkgname=vosk-model-ru
pkgver=0.42
pkgrel=1
pkgdesc="Russian model for Vosk speech recognition"
arch=('any')
url="https://alphacephei.com/vosk/"
license=('Apache')
makedepends=('unzip')

source=("https://alphacephei.com/kaldi/models/${pkgname}-${pkgver}.zip")
sha256sums=('00eb9e5ed8230492da1acf702cd3548e1282256a5fdde8f188253e77217e9429')

package() {
  mkdir -p "${pkgdir}/usr/share/vosk-models"
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/vosk-models/ru"
}
