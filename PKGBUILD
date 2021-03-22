pkgname=boost-note-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('2dba710b46b15b57dd1e6e1e0e673a6d522f3fe254b9baeaad32d00d367a108534479c04b4be024d2b0ba02691e59114c14ad1a82f0e6a2b1dd7c8a832edc4c6')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



