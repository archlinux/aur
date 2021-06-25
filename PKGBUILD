pkgname=boost-note-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('95e3558ac218cd6f2cd25f4b992311ea460fb9dd66e55530fab5cd1aca63e675e1efe39897762a7f319ad46e076bd7a92beb94a1560fb2a985386a0f8f78c934')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



