pkgname=boost-note-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('c34fd2c2d69e8faf4c80a2062fc17769f2d0d53e534f4f8e51d871b02ed1a8977c2c28fb71027e954c7349210f0fc08044eb42493749ab30f9df9f0ff31d79c7')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



