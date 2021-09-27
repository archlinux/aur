pkgname=boost-note-local-bin
pkgver=0.22.3
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary with local space support."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next-local/releases/download/v${pkgver}/boost-note-local-linux.deb")
sha512sums=('9acb836e9601923403662a9b0afceda6ac2273855e0a16310d03cee8c647d453736142fe6c14612880631827c512e10019caead752fe987e1839fafcf039a6fe')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



