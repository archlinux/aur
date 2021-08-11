pkgname=boost-note-local-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Boost Note.next-local, a replacement for Boostnote, an open source note-taking app for programmers. Official binary with local space support."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next-local/releases/download/v${pkgver}/boost-note-local-linux.deb")
sha512sums=('c63fe5c008277080c4fd9bc682ef1a648e1f58b168d8364d053a657176a5e1822fdd42f5fbfa75199429e1d9b18f574941a5561a38720ddc887620d48e904520')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



