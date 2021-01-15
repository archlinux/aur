pkgname=boost-note-bin
pkgver=0.12.4
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('4383c4e343fc59fc03b7cc76392dee6a0ebd2a23c434187570d611df069c16cb9470eab5b1f3543b5c1a718b41713433ddc12f8a6dfd0673cf1bccd05aa51acf')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



