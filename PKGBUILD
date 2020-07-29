pkgname=boost-note-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('7c35abb57fe0d57c4a251706f3709fd794d6d272a21d75b543457f66114d589d1161308d9a7b68e5ff2d52ad0d3ea1d3fc338d9a302c597d349edf0e72464d3a')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



