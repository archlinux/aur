pkgname=boost-note-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('6de9bdf475ed9fe6fa13ea93e6d047c105864be1ec68ffa11e7d4820e3696ebdef0fb29ac56350f8e79787a8346ec95fc401d264d641fe6336004c5c2f12ad8e')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



