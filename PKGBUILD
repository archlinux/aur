pkgname=boost-note-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary for the cloud space version."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('2f9324ea9ec82146bf24f966457db3d22f7275b3ec70635c4cb4361faf06384221a71dce87e6e16deeecf1850a8919e01b4de5d9f18fc3dd5ba525da54e4ab47')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



