pkgname=boost-note-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('35838391f4a5a86e4ae52ba1deb28eafdc75fdd783683eab121497445813f8463ba951776c93b669b388aa256e868d336c1bb4732f47e2558fb38b80014ac3bc')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



