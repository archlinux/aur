pkgname=boost-note-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('6de03a64a58b4efa1bb44ea84c142f389dc8f100f41eeb72414c3bc435758bcc6fa50d7929205bc13b8c125b4b650f1e48fef3963f20ee28d8207485a9a11fa1')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



