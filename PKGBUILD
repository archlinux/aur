# Maintainer: goelzma

pkgname=vosk-model-en-us-lgraph
pkgver=0.22
pkgrel=1
pkgdesc="Big US English model with dynamic graph for Vosk speech recognition"
arch=('any')
url="https://alphacephei.com/vosk/"
license=('Apache')
depends=('unzip')

source=("https://alphacephei.com/kaldi/models/vosk-model-en-us-${pkgver}-lgraph.zip")
sha256sums=('d9838b4aaa82a75c4a17f5aca300eaca129aaab2a7cbf951bafbb500eb9c4334')

package() {
  mkdir -p "${pkgdir}/usr/share/vosk-models"
  mv "${srcdir}/vosk-model-en-us-${pkgver}-lgraph" "${pkgdir}/usr/share/vosk-models/en-us-lgraph"
}
