pkgname=boost-note-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary for the cloud space version."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('813c6baa416909c8226235bb330ee9b076f0f152e829f3865ece06f2b9ffbfb0ba30dd6cf427bfbf1ddb038ad4a530bef797d0f50924db133fc4d0807a09cd9a')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



