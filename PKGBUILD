pkgname=boost-note-local-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary with local space support."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next-local/releases/download/v${pkgver}/boost-note-local-linux.deb")
sha512sums=('835353ec586578aa5d9e650941afb8470b42eda82e722c907309cc5bea83138dcfb4a8ccd79b48c68ed115ba88d35eb0cd5a7116e124ebcc09a10e49086611a0')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



