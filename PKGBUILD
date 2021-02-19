pkgname=boost-note-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('51e46ce55c94a3ceb9368f11a2a02d65ea1284f11f55e0fb42b4cf2cff8a34c76db4f9ecc8aa96868c7f0a3e3bb66ecdbb191a678715c93e493ce179b7019bc0')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



