# Maintainer: goetzc

pkgname=finetune
pkgver=1.2
pkgrel=1
pkgdesc="Audio tagger, fix song information, cover art, lyrics, remove duplicate and missing tracks from your library".
arch=('x86_64')
url="http://flavio.tordini.org/finetune"
license=('custom')
depends=('chromaprint' 'taglib' 'hicolor-icon-theme' 'qt5-base')
source=("${pkgname}-${pkgver}.deb::http://flavio.tordini.org/files/${pkgname}/${pkgname}.deb")
sha256sums=('9c0c629859fb2707afa81c3f54416e50a604b391cf031cf7d83036825327acb7')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"

  install -Dm644 "${pkgdir}"/usr/share/doc/finetune/copyright \
    "${pkgdir}"/usr/share/licenses/${pkgname}/copyright
}
