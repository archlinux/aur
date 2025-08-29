# Maintainer: vvch

pkgname=vosk-model-small-ru
pkgver=0.22
pkgrel=1
pkgdesc="Small Russian model for Vosk speech recognition"
arch=('any')
url="https://alphacephei.com/vosk/"
license=('Apache')
makedepends=('unzip')

source=("https://alphacephei.com/kaldi/models/${pkgname}-${pkgver}.zip")
sha256sums=('961d5ff98a17f4aa6de69864d0aa71fa5bac682301d2b5d17a3f24c5c99a46d4')

package() {
  mkdir -p "${pkgdir}/usr/share/vosk-models"
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/vosk-models/small-ru"
}
