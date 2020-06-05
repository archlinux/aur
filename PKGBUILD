pkgname=boost-note-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('aa09ce4085cd64623e932ff5f169186d9c4d3d88e29fa8eeee6b458cf4763024b05202479e9f9d841f3a0e4e5b0664b2e341e5d2377dc47ca4cdd34dbb59a24d')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



