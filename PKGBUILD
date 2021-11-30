pkgname=boost-note-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary for the cloud space version."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('f8b215d1b8a9e6471aef2a170aa1175d15c92db2ef43ad8cb96c37065bfe0ac99916836e6d65a9936f6cf479d8daf7433aa69bd5f1a08f07ac48987aafd8d520')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



