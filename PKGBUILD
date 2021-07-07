pkgname=boost-note-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('a366b101c06914c5c0496a8eba106d51615a4d29ce819cad569b2a4d5ef9a1b669fec54c9d450c99fab63138f3af81f1bb12086a5bd6727933b77e886afe7c87')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



