# Maintainer: goelzma

pkgname=vosk-model-small-en-us
pkgver=0.15
pkgrel=1
pkgdesc="Small English model for Vosk speech recognition"
arch=('any')
url="https://alphacephei.com/vosk/"
license=('Apache')
depends=('unzip')

source=("https://alphacephei.com/kaldi/models/${pkgname}-${pkgver}.zip")
sha256sums=('30f26242c4eb449f948e42cb302dd7a686cb29a3423a8367f99ff41780942498')

package() {
  mkdir -p "${pkgdir}/usr/share/vosk-models"
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/vosk-models/small-en-us"
}
