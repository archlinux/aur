pkgname=boost-note-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary for the cloud space version."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('2a6b87a0ee44eeef3c912f81573786d31e9abfd14ab1f8517827f1c5eefd91c6fdb272edccd3bda31842e671596ef81887d089d85d68c093ccb355eaddaed181')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



