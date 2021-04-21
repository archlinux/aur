pkgname=boost-note-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('090eaee22a63b763644fd5b155991b291e7bd6480b45b54f28879037a3f30595966a9ee751fe18005b31d828dc22a3595de64c69a1b62dcd754eb2ccb16f8483')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



