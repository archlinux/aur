pkgname=boost-note-bin
pkgver=0.13.2
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('d90e5a27de73ee4f8b6054bb3f09baa2e78023d3e2564dac0a84b783b5b8020fef90af1238d9977ecc1d1864a256dc71129006fe67f087b2dfb9281efc605f1f')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



