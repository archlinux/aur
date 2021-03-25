pkgname=boost-note-bin
pkgver=0.14.3
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source=("${pkgname}-${pkgver}.deb::https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums=('c0dfaa07c934cd67ab31dc6945846402424a79bc7dd52d4f3a148414cb2c16dcf0de70470deadab7be11768a17bb61765d9a5bb7c1eee585b467515944a1c595')


package(){

    # Extract package data
    tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



