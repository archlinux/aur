pkgname=boost-note-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('f3d3f4a40c56de04206a8436eb5a13b1930f0113a091b50632d33351b8988caacdfe4ae87332f95677c0578e0109ac9d5a070766b7364d725b9bd846452d7324')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



