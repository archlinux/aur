pkgname=boost-note-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('3b5f24c1dbc3c35fbda458bbb91f9a1822dfafbc704ef6fb76e2daa29fe3dff41c6cbdc36018793f46a0f5ba4287df710c8d802d0993f3292ecf6fc9be2bc76b')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



