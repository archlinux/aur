pkgname=boost-note-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('a5f32392b98331d8bedc647f37b6dd0bd568c3a3a5d787e77601ad7b91ae8235393dc5719844258ec81bff32736ead80f7911e7d30257f9d8090323b9f3877a7')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



