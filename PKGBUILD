# Maintainer: mfw <espadonne@outlook.com>

pkgname=facsimile
pkgver=0.17.0
pkgrel=1
pkgdesc='Terminal text editor written in Fortran with VSCode-style keybindings'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/facsimile'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran')
source=("git+https://github.com/FortranGoingOnForty/facsimile.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd facsimile
    make
}

package() {
    cd facsimile
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
