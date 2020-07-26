pkgname=boost-note-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('4e29fb283b1e9babc9088663e5124b14ebefaf39d212115875567ababf8bfeae91ff76e777dd09b9d6cfb1dd98560eec4e9aedc16b12c4a14fa7d8d9fc6f63b2')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



