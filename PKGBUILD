pkgname=boost-note-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('8b8a1f3df8131103a28cb2a9a944a39b8884c9671ca3507f26b8090f593ecc6f157176a97f24a830a36bcba4127c620f428675e5343b16a6dcf7b54466000c53')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



