# Maintainer: goetzc

pkgname=finetune
pkgver=1.1
pkgrel=1
pkgdesc="Audio tagger, fix song information, cover art, lyrics, remove duplicate and missing tracks from your library".
arch=('x86_64')
url="http://flavio.tordini.org/finetune"
license=('custom')
depends=('chromaprint' 'taglib' 'hicolor-icon-theme' 'qt5-base')
source=("http://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('9bb98113098959f085451c4da5f5be3900967296cd0abc45ae0f677717c0b489')

package() {
  tar -Jxvf data.tar.xz -C "${pkgdir}"
}

