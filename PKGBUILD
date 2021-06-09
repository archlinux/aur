pkgname=boost-note-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('6b6ee93e63b3320861ae29484d56fed171be8292e7f884228df8c600583ea3cc9a402ba56e25333e1b6b493a059d0cb40b0dfe2918c1520b11645d9613e36e47')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



