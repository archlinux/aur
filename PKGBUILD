pkgname=boost-note-bin
pkgver=0.11.6
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('98c94cd19d28b3fb8cfdcb25b5c9804719f5cbd0222d84212b2e06e4941e5d7dc5931224cdd7d4e3a22066aaac6e2931ed18dd76ec2f885c983e760df4584bd2')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



