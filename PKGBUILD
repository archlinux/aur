pkgname=boost-note-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('9929eecf75684e4606bde5082404e9ee43fc07fa4773a467471cc7bed751139732a074b93df7ef2bd75f9025957095fe5b424c70d8e0e86eabbf4ea7fc43db61')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



