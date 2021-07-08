pkgname=boost-note-bin
pkgver=0.20.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('b210f2ae2145e2a2a3ffe800262cd0c26b58b71155db92fdfa06c462209b407084d9f007fb9ffd1cf3ecd953c1d4e93141e6f3bbc8ec71e91243f91ca7351c87')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



