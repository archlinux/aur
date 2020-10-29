pkgname=boost-note-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('89ca69432bc4a5bf034d8e2a718472959806d7dbbaacccd575ec7ee33a5b9908a2117351ed2ef7b387c11a68e09e995bd8cb4ebecba9eb76ccd187fecb5100a9')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



