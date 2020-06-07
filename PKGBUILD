pkgname=boost-note-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('6e3dc6b8a80de55e7874f9ea265d2aca2b6b2e720409394ccc4a64bedc7348592ad45abfb31b1e8ba5b3522d22d50e0bbb51814d3466c6179c3aaeedcb0c54f1')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



